#!/usr/bin/env bash

# shellcheck disable=SC1091,SC1090
source "${HOMERECIPE_SCRIPTS}"/util.sh

# Map dotfiles first - .envs is then used below
"${HOMERECIPE_SCRIPTS}"/map-dotfiles.sh "$@"

# shellcheck disable=1090
# .envs should define env variables before brewing,
#   namely HOMEBREW_CASK_OPTS="--appdir=/Applications"
if [[ -r "$HOME"/.envs ]]
then
  source "$HOME"/.envs
fi

# Cook recipes
"${HOMERECIPE_SCRIPTS}"/cook-recipes.sh

# Run custom script if run-custom.sh is found
if [[ -r "${HOMERECIPE_DIR}"/custom/run-custom.sh ]]
then
  "${HOMERECIPE_DIR}"/custom/run-custom.sh
fi

# This only creates the symlink for .homerecipe, it needs to be consumed manually
# This should be handled by map-dotfiles.sh
[[ -f "$HOME"/.homerecipe ]] || ln -s "${HOMERECIPE_DIR}"/recipes/.homerecipe "$HOME"
