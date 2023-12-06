sh() {
    if [ -z "$1" ]; then
        run -- sh
    else
        run -- "$*"
    fi
}
