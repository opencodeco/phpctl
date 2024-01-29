#!/usr/bin/env sh

INSTALL_DIR=~/.phpctl
if [ -z "$1" ]; then
    SUDO=sudo
    SYMLINK_DIR=/usr/local/bin/
else
    SUDO=""
    SYMLINK_DIR=$1
fi

symlink() {
    $SUDO ln -sf "${INSTALL_DIR}/bin/composer"     "${SYMLINK_DIR}/composer"
    $SUDO ln -sf "${INSTALL_DIR}/bin/php"          "${SYMLINK_DIR}/php"
    $SUDO ln -sf "${INSTALL_DIR}/bin/php-cs-fixer" "${SYMLINK_DIR}/php-cs-fixer"
    $SUDO ln -sf "${INSTALL_DIR}/bin/phpctl"       "${SYMLINK_DIR}/pctl"
    $SUDO ln -sf "${INSTALL_DIR}/bin/phpctl"       "${SYMLINK_DIR}/phpctl"
    $SUDO ln -sf "${INSTALL_DIR}/bin/phpstan"      "${SYMLINK_DIR}/phpstan"
    $SUDO ln -sf "${INSTALL_DIR}/bin/infection"    "${SYMLINK_DIR}/infection"
    $SUDO ln -sf "${INSTALL_DIR}/bin/phpunit"      "${SYMLINK_DIR}/phpunit"
    $SUDO ln -sf "${INSTALL_DIR}/bin/pest"         "${SYMLINK_DIR}/pest"
    $SUDO ln -sf "${INSTALL_DIR}/bin/pint"         "${SYMLINK_DIR}/pint"
    $SUDO ln -sf "${INSTALL_DIR}/bin/exakat"       "${SYMLINK_DIR}/exakat"
    $SUDO ln -sf "${INSTALL_DIR}/bin/frankenphp"   "${SYMLINK_DIR}/frankenphp"
    $SUDO ln -sf "${INSTALL_DIR}/bin/rector"       "${SYMLINK_DIR}/rector"
}

echo "\033[0;33mInstalling phpctl at \033[0m$INSTALL_DIR"
if [ -d "$INSTALL_DIR" ]; then
    echo "The install directory is not empty. Attempting to remove it..."
    rm -rI $INSTALL_DIR
fi

echo -n ""
git clone --quiet https://github.com/opencodeco/phpctl.git $INSTALL_DIR &
PID=$!
while kill -0 $PID 2> /dev/null; do
    for CHAR in '-' '/' '|' '\'; do
        printf "\b$CHAR"
        sleep 0.1
    done
done

echo "\b "
if [ -z "$1" ]; then
    echo -n "Sudo will be prompted to symlink the phpctl files."
else
    echo -n "Files will be symlinked to ${SYMLINK_DIR}."
fi
echo -n " \033[0;32mDo you want to continue? (y/n)\033[0m "
read -r answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    symlink
else
    echo "\033[0;31mTo use phpctl globally, link the cloned script to your bin directory, like:\033[0m"
    echo ""
    echo "  ${SUDO} ln -sf ${INSTALL_DIR}/bin/php          ${SYMLINK_DIR}/php"
    echo "  ${SUDO} ln -sf ${INSTALL_DIR}/bin/composer     ${SYMLINK_DIR}/composer"
    echo "  ${SUDO} ln -sf ${INSTALL_DIR}/bin/phpctl       ${SYMLINK_DIR}/phpctl"
    echo "  ${SUDO} ln -sf ${INSTALL_DIR}/bin/phpctl       ${SYMLINK_DIR}/pctl"
    echo ""
    echo "\033[0;31mYou can also complement with another useful binaries:\033[0m"
    echo ""
    echo "  ${SUDO} ln -sf ${INSTALL_DIR}/bin/phpunit      ${SYMLINK_DIR}/phpunit"
    echo "  ${SUDO} ln -sf ${INSTALL_DIR}/bin/php-cs-fixer ${SYMLINK_DIR}/php-cs-fixer"
    echo "  ${SUDO} ln -sf ${INSTALL_DIR}/bin/phpstan      ${SYMLINK_DIR}/phpstan"
    echo "  ${SUDO} ln -sf ${INSTALL_DIR}/bin/infection    ${SYMLINK_DIR}/infection"
    echo "  ${SUDO} ln -sf ${INSTALL_DIR}/bin/pest         ${SYMLINK_DIR}/pest"
    echo "  ${SUDO} ln -sf ${INSTALL_DIR}/bin/pint         ${SYMLINK_DIR}/pint"
    echo "  ${SUDO} ln -sf ${INSTALL_DIR}/bin/exakat       ${SYMLINK_DIR}/exakat"
    echo "  ${SUDO} ln -sf ${INSTALL_DIR}/bin/frankenphp   ${SYMLINK_DIR}/frankenphp"
    echo "  ${SUDO} ln -sf ${INSTALL_DIR}/bin/rector       ${SYMLINK_DIR}/rector"
    echo ""
fi
