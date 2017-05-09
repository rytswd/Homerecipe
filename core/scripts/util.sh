#!/usr/bin/env bash

# source this file for each shell command to catch missing params,
#   and define some default variable handling

# Example:
#  # shellcheck disable=SC1091,SC1090
#  source "${HOMERECIPE_SCRIPTS}"/util.sh

# HOMERECIPE_SCRIPTS and HOMERECIPE_DIR need to be defined
# Assumed "cook" is called to run this script
[[ ! -z $HOMERECIPE_DIR ]] || { echo "\$HOMERECIPE_DIR is not found. Process exiting."; exit 1; }
[[ ! -z $HOMERECIPE_SCRIPTS ]] || { echo "\$HOMERECIPE_SCRIPTS is not found. Process exiting."; exit 1; }

[[ ! -z $DEBUG ]] && { echo "\$DEBUG is set, log verbosity is set high"; }

# Default to source .homerecipe if mode is not defined
# shellcheck disable=SC1090
[[ ! -z $HOMERECIPE_MODE ]] || source "${HOMERECIPE_DIR}"/recipes/.homerecipe

# Define utility functions
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
