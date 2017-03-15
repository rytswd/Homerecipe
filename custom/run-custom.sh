#!/usr/bin/env bash

# Run custom scripts under custom directory
# This is a wrapper for personal scripts, which may only be useful for my use case

# HOMERECIPE_SCRIPTS and HOMERECIPE_DIR need to be defined
# Assumed "cook" is called to run this script

[[ ! -z $HOMERECIPE_DIR ]] || { echo "\$HOMERECIPE_DIR is not found. Process exiting."; exit 1; }

# ZSH setup
"${HOMERECIPE_DIR}"/custom/zsh/install-powerline.sh
"${HOMERECIPE_DIR}"/custom/zsh/zsh-setup.sh

# macos recipe if exist - bunch of macos preferences
if [[ -f "${HOMERECIPE_DIR}"/recipes/macos-recipe ]]
then
  bash "${HOMERECIPE_DIR}"/recipes/macos-recipe
fi
