build() {
    echo -e "Building \033[0;32m$PHPCTL_IMAGE\033[0m"
    # shellcheck disable=SC2154
    $PHPCTL_RUNTIME build \
        --build-arg PHP="$PHP_VERSION" \
        --build-arg COMPOSER_AUTH="$COMPOSER_AUTH" \
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
    echo -e "Running \033[0;32m$PHPCTL_IMAGE\033[0m"
    # shellcheck disable=SC2046
    # shellcheck disable=SC2154
    $PHPCTL_RUNTIME run \
        --platform linux/x86_64 \
        --rm "$PHPCTL_TTY" \
        --name "phpctl_$(openssl rand -hex 6)" \
        $(env | awk -F= '/^[[:alpha:]]/{print $1}' | sed 's/^/-e/') \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v ~/.gitconfig:/root/.gitconfig:ro \
        -v "$(pwd)":/usr/local/src -w /usr/local/src \
        -v "$(pwd)"/phpctl.ini:/etc/php"$PHP_VERSION"/conf.d/zzzphp.ini \
        --net host --entrypoint sh \
        ${args[@]} "$1" "$PHPCTL_IMAGE" -c "${*:2}"
}
