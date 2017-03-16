#!/usr/bin/env bash

# Run custom scripts under custom directory
# This is a wrapper for personal scripts, which may only be useful for my use case

# HOMERECIPE_SCRIPTS and HOMERECIPE_DIR need to be defined
# Assumed "cook" is called to run this script

[[ ! -z $HOMERECIPE_DIR ]] || { echo "\$HOMERECIPE_DIR is not found. Process exiting."; exit 1; }

echo "Homerecipe: custom installation starting"

# ZSH setup
[[ -f "${HOMERECIPE_DIR}"/custom/zsh/install-powerline.sh ]] && "${HOMERECIPE_DIR}"/custom/zsh/install-powerline.sh
[[ -f "${HOMERECIPE_DIR}"/custom/zsh/zsh-setup.sh ]] && "${HOMERECIPE_DIR}"/custom/zsh/zsh-setup.sh

# nvm setup
[[ -f "${HOMERECIPE_DIR}"/custom/nvm/nvm-setup.sh ]] && "${HOMERECIPE_DIR}"/custom/nvm/nvm-setup.sh

# macos recipe if exist - bunch of macos preferences
[[ -f "${HOMERECIPE_DIR}"/recipes/macos-recipe ]] && bash "${HOMERECIPE_DIR}"/recipes/macos-recipe
