self-update() {
    echo -e "Heading to \033[33m$PHPCTL_DIR\033[0m to update..."
    cd "$PHPCTL_DIR" || exit 1
    git pull origin HEAD
    echo -e "\033[32mUpdated!\033[0m"
}
