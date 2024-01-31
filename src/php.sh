# shellcheck disable=SC2068

php() {
    run -- php ${@--v}
}

composer() {
    if [ "$1" = "global" ]; then
        COMPOSER_HOME=$(composer-home)
        if [ -z "$COMPOSER_HOME" ]; then
            echo -e "\033[0;31mCOMPOSER_HOME not set.\033[0m"
            exit 1
        fi

        cd "$COMPOSER_HOME" || exit 1
        echo -e "\033[0;32mChanged current directory to $COMPOSER_HOME\033[0m"
        run -- composer ${@:2}
    else
        run -- composer ${@}
    fi
}

repl() {
    run -- psysh ${@}
}

server() {
    port=${1:-80}
    dir=${2:-.}
    run -- php -S 0.0.0.0:"$port" -t "$dir"
}

composer-home() {
    if [ -z "$COMPOSER_HOME" ]; then
        if [ -d ~/.config/composer ]; then
            COMPOSER_HOME="$HOME/.config/composer"
        elif [ -d ~/.composer ]; then
            COMPOSER_HOME="$HOME/.composer"
        fi
    fi

    echo "$COMPOSER_HOME"
}
