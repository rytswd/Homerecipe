#!/usr/bin/env bash

# HOMERECIPE_SCRIPTS and HOMERECIPE_DIR need to be defined
# Assumed "cook" is called to run this script

[[ ! -z $HOMERECIPE_DIR ]] || { echo "\$HOMERECIPE_DIR is not found. Process exiting."; exit 1; }

## Cook recipes
# Homebrew
brew bundle --file="${HOMERECIPE_DIR}"/recipes/brew-recipe

# npm - manual workaround
npmroot=$(npm root -g)
grep -v '^ *#' < "${HOMERECIPE_DIR}"/recipes/npm-recipe | while IFS= read -r i
do
  if [[ -d $npmroot/$i ]]
    then
    echo "Skipping as already installed: $i"
  else
    npm install -g "$i"
  fi
done
