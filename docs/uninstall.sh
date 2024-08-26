#!/usr/bin/env bash

INSTALL_DIR=~/.phpctl
SYMLINK_DIR=/usr/local/bin

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
        sudo rm "${SYMLINK_DIR}/${link}"
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