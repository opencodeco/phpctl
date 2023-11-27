build() {
    docker build --build-arg PHP=$PHP_VERSION -t $PHPCTL_IMAGE .
}

push() {
    docker push $PHPCTL_IMAGE
}

images() {
    docker images | grep phpctl
}

run() {
    args=${@:3}
    docker run --rm -v $(pwd):/opt -w /opt --entrypoint ${2:-php} ${1--it} $PHPCTL_IMAGE ${args:--v}
}
