#!/usr/bin/env bash

# HOMERECIPE_SCRIPTS and HOMERECIPE_DIR need to be defined
# Assumed "cook" is called to run this script

[[ ! -z $HOMERECIPE_DIR ]] || { echo "\$HOMERECIPE_DIR is not found. Process exiting."; exit 1; }

# Map dotfiles first - .envs is then used below
"${HOMERECIPE_SCRIPTS}"/map-dotfiles.sh "$@"

# shellcheck disable=1090
# .envs should define env variables before brewing,
#   namely HOMEBREW_CASK_OPTS="--appdir=/Applications"
if [[ -f "$HOME"/.envs ]]
then
  source "$HOME"/.envs
fi

# Cook recipes
"${HOMERECIPE_SCRIPTS}"/cook-recipes.sh

# Run custom script if run-custom.sh is found
if [[ -f "${HOMERECIPE_DIR}"/misc/run-custom.sh ]]
then
  "${HOMERECIPE_DIR}"/misc/run-custom.sh
fi
