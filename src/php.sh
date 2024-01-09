# shellcheck disable=SC2068

php() {
    run -- php ${@--v}
}

composer() {
    run -- composer ${@}
}

repl() {
    run -- psysh ${@}
}

server() {
    port=${1:-80}
    dir=${2:-.}
    run -- php -S 0.0.0.0:"$port" -t "$dir"
}
