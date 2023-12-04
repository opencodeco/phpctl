php() {
    $(run -it php) ${@:--v}
}

composer() {
    $(run -it composer) $@
}

repl() {
    $(run -it psysh)
}

server() {
    port=${1:-80}
    dir=${2:-.}
    at "$port" php -S 0.0.0.0:"$port" -t "$dir"
}

at() {
    port=${1:-80}
    $(run "-it -p$port:$port" "$2") ${@:3}
}
