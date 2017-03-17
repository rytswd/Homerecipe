#!/usr/bin/env bash

# HOMERECIPE_SCRIPTS and HOMERECIPE_DIR need to be defined
# Assumed "cook" is called to run this script

[[ ! -z $HOMERECIPE_DIR ]] || { echo "\$HOMERECIPE_DIR is not found. Process exiting."; exit 1; }

confirm() {
  # call with a prompt string or use a default
  read -r -p "${1:-Are you sure? [y/N]} " response
  case "$response" in
    [yY][eE][sS]|[yY])
      true
      ;;
    *)
      false
      ;;
  esac
}

confirm "Do you really want to remove all dotfiles and recipes? [y/N]" || { echo "Remove cancelled"; exit; }

echo "Removing existing dotfiles..."
find "${HOMERECIPE_DIR}/dotfiles/" -type f -name ".*" ! \( -name .private \) -ls -delete
echo

echo "Removing existing recipes..."
find "${HOMERECIPE_DIR}/recipes/" -type f -name "*" ! \( -name .homerecipe \) -ls -delete
echo
