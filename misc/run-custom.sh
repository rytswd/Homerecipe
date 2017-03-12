#!/usr/bin/env bash

# This is a wrapper for personal scripts, which may only be useful to my use case

"${HOMERECIPE_DIR}"/misc/install-powerline.sh
"${HOMERECIPE_DIR}"/misc/zsh-setup.sh

# macos recipe if exist - bunch of macos preferences
if [[ -f "${HOMERECIPE_DIR}"/recipes/macos-recipe ]]
then
  "${HOMERECIPE_DIR}"/recipes/macos-recipe
fi
