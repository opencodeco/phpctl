#!/usr/bin/env bash

INSTALL_DIR="${HOME}/.phpctl"
SYMLINK_DIR="/usr/local/bin"
LOCAL_SOURCES_DIR=""

# --- Option Parsing ---
while getopts "hi:s:l:" opt; do
    case $opt in
    h)
        echo "Install phpctl sources and creates symlinks for easy usage."
        echo ""
        echo "Usage: $0 [OPTIONS]"
        echo "Options:"
        echo "  -h                Display this help message and exit"
        echo "  -i <directory>    Set the installation directory (default: $HOME/.phpctl)"
        echo "  -s <directory>    Set the symlink directory (default: /usr/local/bin)"
        echo "  -l <directory>    Set the local sources directory. If empty, will fetch sources from github. (default: empty string)"
        exit 0
        ;;
    i)
        INSTALL_DIR="$OPTARG"
        ;;
    s)
        SYMLINK_DIR="$OPTARG"
        ;;
    l)
        LOCAL_SOURCES_DIR="$OPTARG"
        ;;
    \?)
        echo "Error: Invalid option: -$OPTARG" >&2
        echo "Try '$0 -h' for more information." >&2
        exit 1
        ;;
    :)
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

# Initialize colors (if available)
if tput setaf 1 &>/dev/null; then
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    BLUE=$(tput setaf 4)
    NC=$(tput sgr0) # Reset attributes
else
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[0;33m'
    BLUE='\033[0;34m'
    NC='\033[0m' # No Color
fi

install_sources() {
    echo -e "${YELLOW}Installing phpctl at ${NC}$INSTALL_DIR"
    if [ -d "$INSTALL_DIR" ]; then
        echo "The install directory is not empty. Attempting to remove it..."
        rm -rf "$INSTALL_DIR"
    fi

    if [[ -n "$LOCAL_SOURCES_DIR" ]]; then
        echo "Using local sources from: $LOCAL_SOURCES_DIR"
        cp -r "$LOCAL_SOURCES_DIR" "$INSTALL_DIR"
    else
        GITHUB_REPO="https://github.com/opencodeco/phpctl.git"
        echo "Cloning from $GITHUB_REPO..."
        echo -n ""
        git clone --quiet "$GITHUB_REPO" "$INSTALL_DIR" &
        PID=$!
        while kill -0 $PID 2>/dev/null; do
            for CHAR in '-' '/' '|' "\\"; do
                printf "\b%s" "$CHAR"
                sleep 0.1
            done
        done
        printf "\r"
        echo " done."
    fi
    echo "${GREEN}Success: ${NC}Operation completed successfully."
}

install_sources

echo -n "Files will be symlinked to ${SYMLINK_DIR}."
if [[ -n $SUDO ]]; then
    echo -n "Sudo will be prompted to symlink the phpctl files."
fi

echo -e -n " ${GREEN}Do you want to continue? (Y/n)${NC} "
read -r answer
if [ "$answer" != "${answer#[Nn]}" ]; then
    echo -e "${RED}To use phpctl globally, link the cloned script to your bin directory, like:${NC}"
    for file in "${INSTALL_DIR}"/bin/*; do
        bin=$(basename "$file")
        echo "  ${SUDO} ln -sf ${INSTALL_DIR}/bin/$bin ${SYMLINK_DIR}/$bin"
    done
    echo -e "${YELLOW}Or add ${INSTALL_DIR}/bin to your PATH."
else
    $SUDO "${INSTALL_DIR}/scripts/symlink-bins.sh" "${INSTALL_DIR}" "${SYMLINK_DIR}"
fi
