build() {
    docker build \
        --build-arg PHP="$PHP_VERSION" \
        --build-arg COMPOSER_AUTH="$COMPOSER_AUTH" \
        ${build[@]} -t "$PHPCTL_IMAGE" .
}

push() {
    docker push "$PHPCTL_IMAGE"
}

images() {
    docker images | grep phpctl
}

run() {
    docker run \
        --rm "$PHPCTL_TTY" \
        -e COMPOSER_AUTH="$COMPOSER_AUTH" \
        -v "$(pwd)":/opt -w /opt \
        --entrypoint sh \
        ${args[@]} $1 "$PHPCTL_IMAGE" -c "${*:2}"
}
