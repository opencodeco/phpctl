sh() {
    if [ -z "$1" ]; then
        # shellcheck disable=SC2091
        $(run "$PHPCTL_TTY" sh)
    else
        $(run "$PHPCTL_TTY" sh) -c "$*"
    fi
}
