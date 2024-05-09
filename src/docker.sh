build() {
    local with_exakat=""
    if [[ "$*" == *--with-exakat* ]]; then
        with_exakat="--build-arg WITH_EXAKAT=1"
    fi

    local without_watchr=""
    if [[ "$*" == *--without-watchr* ]] || [ "$PHP_VERSION" = "81" ]; then
        without_watchr="--build-arg WITHOUT_WATCHR=1"
    fi

    echo -e "Building \033[0;32m$PHPCTL_IMAGE\033[0m"
    # shellcheck disable=SC2068
    # shellcheck disable=SC2154
    $PHPCTL_RUNTIME buildx build --no-cache \
        --build-arg PHP="$PHP_VERSION" \
        --build-arg COMPOSER_AUTH="$COMPOSER_AUTH" \
        --build-arg HOST_USER="$(whoami)" \
        $with_exakat \
        $without_watchr \
        ${build[@]} -t "$PHPCTL_IMAGE" .
}

push() {
    echo -e "Pushing \033[0;32m$PHPCTL_IMAGE\033[0m"
    $PHPCTL_RUNTIME push "$PHPCTL_IMAGE"
}

pull() {
    echo -e "Pulling \033[0;32m$PHPCTL_IMAGE\033[0m"
    $PHPCTL_RUNTIME pull "$PHPCTL_IMAGE"
}

images() {
    $PHPCTL_RUNTIME images | grep phpctl
}

run() {
    if [ -n "$PHPCTL_VERBOSE" ]; then
        echo -e "Running \033[0;32m$PHPCTL_IMAGE\033[0m"
    fi

    local phpctl_ini=""
    if [ -s phpctl.ini ]; then
        phpctl_ini="-v $(pwd)/phpctl.ini:/etc/php$PHP_VERSION/conf.d/zzzphp.ini"
    fi

    local composer_home=""
    composer_home="$(composer-home)"
    if [ -n "$composer_home" ]; then
        composer_home="-v $composer_home:$composer_home"
    fi

    if [ -n "$GIT_EXEC_PATH" ]; then
        # In a Git hook environment, we need to disable TTY allocation
        PHPCTL_TTY="--label=no-tty"
	fi

    # shellcheck disable=SC2046
    # shellcheck disable=SC2068
    # shellcheck disable=SC2086
    # shellcheck disable=SC2154
    $PHPCTL_RUNTIME run \
        --init \
        --platform linux/x86_64 \
        --rm "$PHPCTL_TTY" \
        --name "phpctl_$(openssl rand -hex 6)" \
        --user "$PHPCTL_USER" \
        $(env | awk -F= '/^[[:alpha:]]/{print $1}' | sed 's/^/-e/') \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v ~/.gitconfig:/root/.gitconfig:ro \
        -v "$(pwd)":/usr/local/src -w /usr/local/src \
        -v "$PHPCTL_DIR/php.ini:/etc/php$PHP_VERSION/conf.d/zphp.ini" \
        $phpctl_ini \
        $composer_home \
        --net host --entrypoint sh \
        ${args[@]} "$1" "$PHPCTL_IMAGE" -c "${*:2}"
}
