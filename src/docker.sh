build() {
    docker build --build-arg PHP="$PHP_VERSION" -t "$PHPCTL_IMAGE" .
}

push() {
    docker push "$PHPCTL_IMAGE"
}

images() {
    docker images | grep phpctl
}

run() {
    composer_auth="${COMPOSER_AUTH//[$'\t\r\n ']}"
    echo "docker run --rm -e COMPOSER_AUTH=$composer_auth -v $(pwd):/opt -w /opt --entrypoint ${2:-php} ${1:-$PHPCTL_TTY} $PHPCTL_IMAGE"
}
