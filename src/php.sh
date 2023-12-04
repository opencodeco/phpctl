php() {
    run -it php "$@"
}

composer() {
    run -it composer "$@"
}

server() {
    port=${1:-80}
    dir=${2:-.}
    at "$port" php -S 0.0.0.0:"$port" -t "$dir"
}

at() {
    port=${1:-80}
    # shellcheck disable=SC2068
    run "-it -p$port:$port" ${@:2}
}
