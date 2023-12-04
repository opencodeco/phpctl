doctor() {
    echo PHP_VERSION="$PHP_VERSION"
    echo PHPCTL_IMAGE="$PHPCTL_IMAGE"
}

sh() {
    if [ -z "$1" ]; then
        run -it sh
    else
        run -it sh -c "$@"
    fi
}
