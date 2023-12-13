build() {
    $PHPCTL_RUNTIME build \
        --build-arg PHP="$PHP_VERSION" \
        --build-arg COMPOSER_AUTH="$COMPOSER_AUTH" \
        ${build[@]} -t "$PHPCTL_IMAGE" .
}

push() {
    $PHPCTL_RUNTIME push "$PHPCTL_IMAGE"
}

images() {
    $PHPCTL_RUNTIME images | grep phpctl
}

run() {
    $PHPCTL_RUNTIME run \
        --rm "$PHPCTL_TTY" \
        -e COMPOSER_AUTH="$COMPOSER_AUTH" \
        -v "$(pwd)":/opt -w /opt \
        --entrypoint sh \
        ${args[@]} $1 "$PHPCTL_IMAGE" -c "${*:2}"
}
