#!/usr/bin/env bash

# shellcheck disable=SC1091,SC1090
source "${HOMERECIPE_SCRIPTS}"/util.sh

## Run Setup
"${HOMERECIPE_SCRIPTS}"/setup.sh

## Cook dotfiles
# Map dotfiles first, then .envs is used from the dotfiles
# .envs should define env variables before brewing,
#   namely HOMEBREW_CASK_OPTS="--appdir=/Applications"
"${HOMERECIPE_SCRIPTS}"/cook-dotfiles.sh "$@" \
    && [[ -r "$HOME"/.envs ]] && source "$HOME"/.envs

## Cook recipes
"${HOMERECIPE_SCRIPTS}"/cook-recipes.sh

## Misc
# Run custom script if run-custom.sh is found
[[ -r "${HOMERECIPE_DIR}"/custom/run-custom.sh ]] && "${HOMERECIPE_DIR}"/custom/run-custom.sh
