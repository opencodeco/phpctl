php() {
    $(run "$PHPCTL_TTY" php) ${@:--v}
}

composer() {
    $(run "$PHPCTL_TTY" composer) $@
}

repl() {
    # shellcheck disable=SC2091
    $(run "$PHPCTL_TTY" psysh)
}

server() {
    port=${1:-80}
    dir=${2:-.}
    at "$port" php -S 0.0.0.0:"$port" -t "$dir"
}

at() {
    port=${1:-80}
    $(run "$PHPCTL_TTY -p$port:$port" "$2") ${@:3}
}
