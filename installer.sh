#!/usr/bin/env sh

INSTALL_DIR=~/.phpctl

symlink() {
    sudo ln -sf "${INSTALL_DIR}/bin/composer"     /usr/local/bin/composer
    sudo ln -sf "${INSTALL_DIR}/bin/php"          /usr/local/bin/php
    sudo ln -sf "${INSTALL_DIR}/bin/php-cs-fixer" /usr/local/bin/php-cs-fixer
    sudo ln -sf "${INSTALL_DIR}/bin/phpctl"       /usr/local/bin/pctl
    sudo ln -sf "${INSTALL_DIR}/bin/phpctl"       /usr/local/bin/phpctl
    sudo ln -sf "${INSTALL_DIR}/bin/phpstan"      /usr/local/bin/phpstan
    sudo ln -sf "${INSTALL_DIR}/bin/phpunit"      /usr/local/bin/phpunit
}

echo "\033[0;33mInstalling phpctl at \033[0m$INSTALL_DIR"
rm -rf $INSTALL_DIR
git clone --quiet https://github.com/opencodeco/phpctl.git $INSTALL_DIR

echo "Sudo will be prompted to symlink the phpctl files. \033[0;32mDo you want to continue? (y/n)\033[0m"
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    symlink
else
    echo "\033[0;31mTo use phpclt globally, link the cloned script to your bin directory, like:\033[0m"
    echo ""
    echo "  sudo ln -sf ${INSTALL_DIR}/bin/php          /usr/local/bin/php"
    echo "  sudo ln -sf ${INSTALL_DIR}/bin/composer     /usr/local/bin/composer"
    echo "  sudo ln -sf ${INSTALL_DIR}/bin/phpctl       /usr/local/bin/phpctl"
    echo "  sudo ln -sf ${INSTALL_DIR}/bin/phpctl       /usr/local/bin/pctl"
    echo ""
    echo "\033[0;31mYou can also complement with another useful binaries:\033[0m"
    echo ""
    echo "  sudo ln -sf ${INSTALL_DIR}/bin/phpunit      /usr/local/bin/phpunit"
    echo "  sudo ln -sf ${INSTALL_DIR}/bin/php-cs-fixer /usr/local/bin/php-cs-fixer"
    echo "  sudo ln -sf ${INSTALL_DIR}/bin/phpstan      /usr/local/bin/phpstan"
    echo ""
fi
