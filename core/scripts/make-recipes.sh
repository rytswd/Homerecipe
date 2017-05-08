#!/usr/bin/env bash

# shellcheck disable=SC1091,SC1090
source "${HOMERECIPE_SCRIPTS}"/util.sh

confirm() {
  # call with a prompt string or use a default
  read -r -p "${1:-Are you sure? [y/N]} " response
  case "$response" in
    [yY][eE][sS]|[yY])
      true
      ;;
    *)
      false
      ;;
  esac
}

confirm "All the existing recipes and dotfiles will be overridden, are you sure? [y/N]" || { echo "Recipe making cancelled"; exit; }

# Get brew bundle (includes cask)
brew bundle dump --force --file="${HOMERECIPE_DIR}"/recipes/brew-recipe
# brew bundle --file=recipes/brew-recipe

# Get npm global recipe
# TODO: This is a workaround - there must be a better way...
command ls "$(npm root -g)" > "${HOMERECIPE_DIR}"/recipes/npm-recipe
# for i in `cat recipes/npm-recipe`; do npm install -g $i; done
