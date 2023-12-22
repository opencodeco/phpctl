php() {
    run -- php ${@--v}
}

composer() {
    run -- composer $@
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
    if [ ! -f vendor/bin/phpunit ]; then
        echo "PHPUnit not found. Installing..."
        composer require --dev phpunit/phpunit
    fi;

    run -- vendor/bin/phpunit ${@}
}

php-cs-fixer() {
    if [ ! -f vendor/bin/php-cs-fixer ]; then
        echo "PHP-CS-Fixer not found. Installing..."
        composer require --dev friendsofphp/php-cs-fixer
    fi;

    run -- vendor/bin/php-cs-fixer ${@}
}
