#!/usr/bin/env bash

INSTALL_DIR=~/.phpctl
if [ -z "$1" ]; then
    SUDO=sudo
    SYMLINK_DIR=/usr/local/bin
else
    SUDO=""
    SYMLINK_DIR=$1
fi

echo -e "\033[0;33mInstalling phpctl at \033[0m$INSTALL_DIR"
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
printf "\r"


if [ -z "$1" ]; then
    echo -n "Sudo will be prompted to symlink the phpctl files."
else
    echo -n "Files will be symlinked to ${SYMLINK_DIR}."
fi
echo -e -n " \033[0;32mDo you want to continue? (y/n)\033[0m "
read -r answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    $SUDO ${INSTALL_DIR}/scripts/symlink-bins.sh ${INSTALL_DIR}
else
    echo -e "\033[0;31mTo use phpctl globally, link the cloned script to your bin directory, like:\033[0m"
    echo ""
    for file in "${INSTALL_DIR}"/bin/*; do
        bin=$(basename "$file")
        echo "  ${SUDO} ln -sf ${INSTALL_DIR}/bin/$bin ${SYMLINK_DIR}/$bin"
    done
fi
