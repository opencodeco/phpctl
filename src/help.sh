man() {
    help
}

list() {
    help
}

help() {
    echo -e "     _           _   _ "
    echo -e " ___| |_ ___ ___| |_| |"
    echo -e "| . |   | . |  _|  _| |"
    echo -e "|  _|_|_|  _|___|_| |_|"
    echo -e "|_|     |_|            "
    echo -e "$(doctor)"
    echo -e ""
    echo -e "\033[0;33mUsage:\033[0m             "
    echo -e "  phpctl <command> [arguments]      "
    echo -e ""
    echo -e "\033[0;33mAvailable commands:\033[0m"
    echo -e "\033[0;32m  help or man                \033[0m Displays this help message"
    echo -e "\033[0;32m  php                        \033[0m Runs PHP commands"
    echo -e "\033[0;32m  composer                   \033[0m Runs Composer commands"
    echo -e "\033[0;32m  server [port] [directory]  \033[0m Runs PHP's built-in web server (default port is 80 and default directory is current .)"
    echo -e "\033[0;32m  sh [commands]              \033[0m Starts an interactive Shell session or runs sh commands"
    echo -e "\033[0;32m  repl                       \033[0m Starts a PHP REPL session (powered by PsySH)"
    echo -e "\033[0;32m  bundle                     \033[0m Bundles a PHP project into a Docker image"
    echo -e "\033[0;32m  create [framework] [dir]   \033[0m Creates a new project using the given framework (or package)"
    echo -e "\033[0;32m  init [skeleton]            \033[0m Initializes a skeleton configuration (phpunit, php-cs-fixer)"
    echo -e "\033[0;32m  self-update                \033[0m Updates phpctl itself"
    echo -e "\033[0;32m  doctor                     \033[0m Inspects the current PHP_VERSION and PHPCTL_IMAGE"
    echo -e "\033[0;32m  build                      \033[0m Builds the current Dockerfile (useful for custom images)"
    echo -e "\033[0;32m  images                     \033[0m Shows local phpctl images"
    echo -e ""
    echo -e "\033[0;33mTools:\033[0m"
    echo -e "\033[0;32m  box                        \033[0m Runs Box (PHAR builder)"
    echo -e "\033[0;32m  composer-require-checker   \033[0m Runs ComposerRequireChecker"
    echo -e "\033[0;32m  couscous                   \033[0m Runs Couscous"
    echo -e "\033[0;32m  exakat                     \033[0m Runs Exakat"
    echo -e "\033[0;32m  frankenphp                 \033[0m Runs FrankenPHP"
    echo -e "\033[0;32m  infection                  \033[0m Runs Infection, a PHP Mutation Testing Framework"
    echo -e "\033[0;32m  pest                       \033[0m Runs Pest"
    echo -e "\033[0;32m  php-cs-fixer               \033[0m Runs PHP-CS-Fixer"
    echo -e "\033[0;32m  phpcbf                     \033[0m Runs PHP_CodeSniffer (phpcbf)"
    echo -e "\033[0;32m  phpcs                      \033[0m Runs PHP_CodeSniffer (phpcs)"
    echo -e "\033[0;32m  phpmd                      \033[0m Runs PHP Mess Detector"
    echo -e "\033[0;32m  phpstan                    \033[0m Runs PHPStan"
    echo -e "\033[0;32m  phpunit                    \033[0m Runs PHPUnit"
    echo -e "\033[0;32m  pint                       \033[0m Runs Pint"
    echo -e "\033[0;32m  rector                     \033[0m Runs Rector"
    echo -e "\033[0;32m  watchr                     \033[0m Runs watchr"
    echo -e ""
}
