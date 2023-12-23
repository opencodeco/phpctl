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


phpunit() {
    if [ ! -f vendor/bin/phpunit ]; then
        echo "PHPUnit not found. Installing..."
        run -- composer require --dev phpunit/phpunit
    fi;

    run -- vendor/bin/phpunit ${@}
}

php-cs-fixer() {
    if [ ! -f vendor/bin/php-cs-fixer ]; then
        echo "PHP-CS-Fixer not found. Installing..."
        run -- composer require --dev friendsofphp/php-cs-fixer
    fi;

    run -- vendor/bin/php-cs-fixer ${@}
}

phpstan() {
    if [ ! -f vendor/bin/phpstan ]; then
        echo "PHPStan not found. Installing..."
        run -- composer require --dev phpstan/phpstan
    fi;

    run -- vendor/bin/phpstan ${@}
}

infection() {
    if [ ! -f vendor/bin/infection ]; then
        echo "Infection not found. Installing..."
        run -- composer require --dev infection/infection
    fi;

    run -- vendor/bin/infection ${@}
}