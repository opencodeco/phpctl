is_brew_installed() {
  command -v brew >/dev/null 2>&1
}

is_tap_installed() {
  local tap_name="$1"
  brew tap | grep -q "^$tap_name$"
}

self-update() {
  local tap_to_check="opencodeco/phpctl"
  local full_tap_pkg="$tap_to_check/phpctl"
  
  if is_brew_installed && is_tap_installed "$tap_to_check"; then
    echo -e "\033[32mSeems phpctl was installed by Homebrew, to update it run\033[0m brew upgrade $full_tap_pkg"
  else
    echo -e "Heading to \033[33m$PHPCTL_DIR\033[0m to update..."
    cd "$PHPCTL_DIR" || exit 1
    git pull origin HEAD
    echo -e "\033[32mUpdated!\033[0m"
  fi    
}
