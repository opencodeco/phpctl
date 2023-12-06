#!/usr/bin/env bash

INSTALL_DIR=~/.phpctl

symlink() {
    sudo ln -sf "${INSTALL_DIR}/phpctl" /usr/local/bin/phpctl
    sudo ln -sf "${INSTALL_DIR}/phpctl" /usr/local/bin/pctl
}

echo -e "\033[0;33mInstalling phpctl at \033[0m$INSTALL_DIR"
rm -rf $INSTALL_DIR
git clone --quiet https://github.com/opencodeco/phpctl.git $INSTALL_DIR

echo -e "Sudo will be prompted to symlink the phpctl files. \033[0;32mDo you want to continue?\033[0m"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) symlink; break;;
        No ) exit;;
    esac
done
