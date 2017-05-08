#!/usr/bin/env bash

# Run custom scripts under custom directory
# This is a wrapper for personal scripts, which may only be useful for my use case

# shellcheck disable=SC1091,SC1090
source "${HOMERECIPE_SCRIPTS}"/util.sh

echo "Homerecipe: custom installation starting"

# ZSH setup
[[ -r "${HOMERECIPE_DIR}"/custom/zsh/install-powerline.sh ]] && "${HOMERECIPE_DIR}"/custom/zsh/install-powerline.sh
[[ -r "${HOMERECIPE_DIR}"/custom/zsh/zsh-setup.sh ]] && "${HOMERECIPE_DIR}"/custom/zsh/zsh-setup.sh

# nvm setup
[[ -r "${HOMERECIPE_DIR}"/custom/nvm/nvm-setup.sh ]] && "${HOMERECIPE_DIR}"/custom/nvm/nvm-setup.sh

# macos recipe if exist - bunch of macos preferences
if [[ $HOMERECIPE_MODE == 'macos' ]]; then
  [[ -r "${HOMERECIPE_DIR}"/recipes/macos-recipe ]] && bash "${HOMERECIPE_DIR}"/recipes/macos-recipe
fi
