#!/usr/bin/env bash

# shellcheck disable=SC1091,SC1090
source "${HOMERECIPE_SCRIPTS}"/util.sh

echo "WARNING - you are about to remove all dotfiles and recipes, even for other platforms."
echo "Current platform mode is set to: ${HOMERECIPE_MODE}"
echo 
confirm "Do you really want to remove all dotfiles and recipes? [y/N]" || { echo "Remove cancelled"; exit; }

echo "Removing existing dotfiles..."
find "${HOMERECIPE_DIR}/dotfiles/" -type f -name ".*" ! \( -name .private \) -ls -delete
echo

echo "Removing existing recipes..."
find "${HOMERECIPE_DIR}/recipes/" -type f -name "*" ! \( -name .homerecipe \) -ls -delete
echo
