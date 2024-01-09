box() {
    if [ -f vendor/bin/box ]; then
        run -- vendor/bin/box ${@}
    else
        run -- box ${@}
    fi;
}

couscous() {
    if [ -f vendor/bin/couscous ]; then
        run -- vendor/bin/couscous ${@}
    else
        run -- couscous ${@}
    fi;
}

exakat() {
    if [ -f vendor/bin/exakat ]; then
        run -- vendor/bin/exakat ${@}
    else
        run -- exakat ${@}
    fi;
}

infection() {
    if [ -f vendor/bin/infection ]; then
        run -- vendor/bin/infection ${@}
    else
        run -- infection ${@}
    fi;
}

pest() {
    run -- vendor/bin/pest ${@}
}

php-cs-fixer() {
    if [ -f vendor/bin/php-cs-fixer ]; then
        run -- vendor/bin/php-cs-fixer ${@}
    else
        run -- php-cs-fixer ${@}
    fi;
}

phpstan() {
    if [ -f vendor/bin/phpstan ]; then
        run -- vendor/bin/phpstan ${@}
    else
        run -- phpstan ${@}
    fi;
}

phpunit() {
    if [ -f vendor/bin/phpunit ]; then
        run -- vendor/bin/phpunit ${@}
    else
        run -- phpunit ${@}
    fi;
}

pint() {
    if [ -f vendor/bin/pint ]; then
        run -- vendor/bin/pint ${@}
    else
        run -- pint ${@}
    fi;
}
