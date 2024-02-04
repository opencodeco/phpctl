doctor() {
    echo -e "PHP_VERSION=\033[0;32m$PHP_VERSION\033[0m"

    for var in $(set | awk -F= '/^[[:alpha:]]/{print $1}'); do
        if [[ $var == PHPCTL_* ]]; then
            echo -e "$var=\033[0;32m${!var}\033[0m"
        fi
    done
}
