#!/usr/bin/env bash

# shellcheck disable=SC1091,SC1090
source "${HOMERECIPE_SCRIPTS}"/util.sh

## Cook recipes
# Homebrew
if [[ $HOMERECIPE_MODE == 'macos' ]]; then
  brew bundle --file="${HOMERECIPE_DIR}"/recipes/brew-recipe
fi

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

# pip - TODO: work with JSON format
