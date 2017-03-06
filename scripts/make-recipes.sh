#!/bin/bash

# Get brew bundle (includes cask)
brew bundle dump --force --file="${HOMERECIPE_DIR}"/recipes/brew-recipe
# brew bundle --file=recipes/brew-recipe

# Get npm global recipe
# TODO: This is a workaround - there must be a better way...
command ls "$(npm root -g)" > "${HOMERECIPE_DIR}"/recipes/npm-recipe
# for i in `cat recipes/npm-recipe`; do npm install -g $i; done
