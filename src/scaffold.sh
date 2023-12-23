create() {
    package_alias="$1"
    case "$package_alias" in
        "hyperf")
            package="hyperf/hyperf-skeleton"
            ;;
        "laravel")
            package="laravel/laravel"
            ;;
        "symfony")
            package="symfony/skeleton"
            ;;
        *)
            package="$package_alias"
            ;;
    esac

    run -- composer create-project "$package" "$2"
}

init() {
    skeleton_alias="$1"
    case "$skeleton_alias" in
        "phpunit")
            skeleton="phpunit.xml"
            ;;
        "php-cs-fixer")
            skeleton=".php-cs-fixer.php"
            ;;
        "phpstan")
                    skeleton="phpstan.neon"
                    ;;
        "infection")
            skeleton="infection.json5"
            ;;
        *)
            echo -e "\033[0;31mSkeleton ($skeleton_alias) not handled.\033[0m"
            exit 1
    esac

    cp "$PHPCTL_DIR/skeletons/$skeleton" "$skeleton"
    echo -e "\033[0;32m$skeleton created!\033[0m"
}
