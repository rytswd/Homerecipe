#!/usr/bin/env bash

# source this file for each shell command to catch missing params,
#   and define some default variable handling

# Example:
#  # shellcheck disable=SC1091,SC1090
#  source "${HOMERECIPE_SCRIPTS}"/util.sh

# shellcheck disable=SC1090
# For first time run, it is possible that .homerecipe isn't loaded during the startup.
# If the file is found in home directory, this tries loading variables from it.
[[ -L "$HOME"/.homerecipe ]] && source "$HOME"/.homerecipe

#[[ ! -z $DEBUG ]] && { echo "\$DEBUG is set, log verbosity is set high"; }

## Validations

# HOMERECIPE_SCRIPTS and HOMERECIPE_DIR need to be defined
# Assumed "cook" is called to run this script
[[ ! -z $HOMERECIPE_DIR ]] || { echo "\$HOMERECIPE_DIR is not found. Process exiting."; exit 1; }
[[ ! -z $HOMERECIPE_SCRIPTS ]] || { echo "\$HOMERECIPE_SCRIPTS is not found. Process exiting."; exit 1; }

## Utility Functions

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
