sh() {
    if [ -z "$1" ]; then
        # shellcheck disable=SC2091
        $(run -it sh)
    else
        $(run -it sh) -c "$*"
    fi
}
