php() {
    run -- php ${@--v}
}

repl() {
    run -- psysh
}

at() {
    run "-p$1:$1" ${@:2}
}

server() {
    port=${1:-80}
    dir=${2:-.}
    at "$port" php -S 0.0.0.0:"$port" -t "$dir"
}

init-phpunit() {
    cp "$PHPCTL_DIR/phpunit.template.xml" phpunit.xml
}

phpunit() {
    run -- vendor/bin/phpunit ${@}
}

php-cs-fixer() {
    run -- vendor/bin/php-cs-fixer ${@}
}
