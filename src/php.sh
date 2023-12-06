php() {
    run -- php ${@--v}
}

repl() {
    run -- psysh
}

fix() {
    run -- php-cs-fixer fix $@
}

at() {
    run "-p$1:$1" ${@:2}
}

server() {
    port=${1:-80}
    dir=${2:-.}
    at "$port" php -S 0.0.0.0:"$port" -t "$dir"
}
