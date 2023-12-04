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
    arg=${3:--v}
    args=${*:4}

    if [ -z "$args" ]; then
        # shellcheck disable=SC2086
        docker run --rm -v "$(pwd)":/opt -w /opt --entrypoint "${2:-php}" ${1--it} "$PHPCTL_IMAGE" "$arg"
    else
        # shellcheck disable=SC2086
        docker run --rm -v "$(pwd)":/opt -w /opt --entrypoint "${2:-php}" ${1--it} "$PHPCTL_IMAGE" "$arg" $args
    fi
}
