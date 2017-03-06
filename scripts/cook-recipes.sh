#!/usr/bin/env bash

# HOMERECIPE_SCRIPTS and HOMERECIPE_DIR need to be defined
# Assumed "cook all" is called to run this script

## Cook recipes
# Homebrew
brew bundle --file="${HOMERECIPE_DIR}"/recipes/brew-recipe

# npm - manual workaround
for i in $(cat "${HOMERECIPE_DIR}"/recipes/npm-recipe); do npm install -g "$i"; done

# macos recipe if exist - bunch of macos preferences
if [[ -f "${HOMERECIPE_DIR}"/recipes/macos-recipe ]]
then
  "${HOMERECIPE_DIR}"/recipes/macos-recipe
fi
