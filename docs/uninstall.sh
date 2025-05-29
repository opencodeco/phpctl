#!/usr/bin/env bash

INSTALL_DIR="${HOME}/.phpctl"
SYMLINK_DIR="/usr/local/bin"

while getopts "hi:s:" opt; do
    case $opt in
    h)
        echo "Uninstall phpctl."
        echo ""
        echo "Usage: $0 [OPTIONS]"
        echo "Options:"
        echo "  -h                Display this help message and exit"
        echo "  -i <directory>    Set the installation directory (default: $HOME/.phpctl)"
        echo "  -s <directory>    Set the symlink directory (default: /usr/local/bin)"
        exit 0
        ;;
    i)
        INSTALL_DIR="$OPTARG"
        ;;
    s)
        SYMLINK_DIR="$OPTARG"
        ;;
    \?) # Handle invalid options
        echo "Error: Invalid option: -$OPTARG" >&2
        echo "Try '$0 -h' for more information." >&2
        exit 1
        ;;
    :) # Handle missing arguments for options that require them
        echo "Error: Option -$OPTARG requires an argument." >&2
        echo "Try '$0 -h' for more information." >&2
        exit 1
        ;;
    esac
done

# Shift off the options and their arguments, so that any remaining
# positional parameters (if any) are correctly handled.
shift $((OPTIND - 1))

# Compatibility with previous script version
if [[ $SYMLINK_DIR = "/usr/local/bin" && -n ${1} ]]; then
    SYMLINK_DIR=$1
fi

if [ ! -w "${SYMLINK_DIR}" ]; then
    ELEVATED=true
else
    ELEVATED=false
fi

if "$ELEVATED"; then
    echo "Running in elevated mode. This might require sudo for operations in ${SYMLINK_DIR}."
fi

[[ $ELEVATED = true ]] && SUDO="sudo" || SUDO=""

LINKS=(
    composer
    composer-require-checker
    co-phpunit
    couscous
    deptrac
    exakat
    frankenphp
    infection
    notty
    pest
    php
    phpcbf
    phpcs
    php-cs-fixer
    phpctl
    phpmd
    phpstan
    phpunit
    pint
    rector
    watchr
)

# Removing symlink
echo "Removing symbolic links..."
for link in "${LINKS[@]}"; do
    if [ -L "${SYMLINK_DIR}/${link}" ]; then
        $SUDO rm "${SYMLINK_DIR}/${link}"
        echo "Removed ${SYMLINK_DIR}/${link}"
    else
        echo "Link ${SYMLINK_DIR}/${link} does not exist, skipping."
    fi
done

# Opcional: removing directory
echo -e "\nDo you want to remove the installation directory (${INSTALL_DIR})? (Y/n) "
read -r answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    rm -rf "$INSTALL_DIR"
    echo "Removed installation directory: ${INSTALL_DIR}"
else
    echo "Skipping removal of installation directory."
fi

echo "Uninstallation complete."
