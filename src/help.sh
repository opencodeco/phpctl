man() {
    help
}

list() {
    help
}

help() {
    echo "                                   "
    echo "     _           _   _             "
    echo " ___| |_ ___ ___| |_| |            "
    echo "| . |   | . |  _|  _| |            "
    echo "|  _|_|_|  _|___|_| |_|            "
    echo "|_|     |_|                        "
    echo "                                   "
    echo "Usage: phpctl <command> [arguments]"
    echo "                                   "
    echo "Commands:"
    echo "  help                        Show this help message"
    echo "  doctor                      Inspects the current PHP_VERSION and PHPCTL_IMAGE"
    echo "  install                     Install phpctl (and pctl) globally in you system"
    echo "  build                       Builds the current Dockerfile (useful for custom images)"
    echo "  images                      Shows local phpctl images"
    echo "  php                         Runs PHP commands"
    echo "  composer                    Runs Composer commands"
    echo "  server [port] [directory]   Runs PHP's built-in web server (default port is 80 and default directory is current .)"
    echo "  sh [commands]               Starts an interactive Shell session or runs sh commands"
    echo "  at [port] [command]         Runs commands within a bound port (default port is 80)"
    echo "  repl                        Starts a PHP REPL session (powered by PsySH)"
    echo "  fix [directory]             Runs PHP CS Fixer on the given directory."
    echo "                                   "
}
