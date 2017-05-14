#!/usr/bin/env bash

# shellcheck disable=SC1091,SC1090
source "${HOMERECIPE_SCRIPTS}"/util.sh

# Map .homerecipe to the home directory
[[ -f "$HOME"/.homerecipe ]] || ln -s "${HOMERECIPE_DIR}"/recipes/.homerecipe "$HOME"

# Because sourcing a file inside subshell is not going to work,
#   this sets up a temporary alias
# shellcheck disable=SC2139
alias cook="${HOMERECIPE_DIR}"/cook
