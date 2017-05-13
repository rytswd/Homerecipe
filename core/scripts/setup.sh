#!/usr/bin/env bash

# shellcheck disable=SC1091,SC1090
source "${HOMERECIPE_SCRIPTS}"/util.sh

# Map .homerecipe to the home directory
[[ -f "$HOME"/.homerecipe ]] || ln -s "${HOMERECIPE_DIR}"/recipes/.homerecipe "$HOME"
# As it includes some key variables such as HOMERECIPE_MODE,
#   this tries to load whichever .homerecipe available
if [[ -f "$HOME"/.homerecipe ]]; then
  source "$HOME"./homerecipe
else
  source "${HOMERECIPE_DIR}"/recipes/.homerecipe
fi

# One additional step to untrack any chanegs to .homerecipe file
#   this makes it easy to keep local file as "up-to-date"
git update-index --assume-unchanged "${HOMERECIPE_DIR}"/recipes/.homerecipe
# If you wish to undo, run the following command
#   $ git update-index --no-assume-unchanged "${HOMERECIPE_DIR}"/recipes/.homerecipe
