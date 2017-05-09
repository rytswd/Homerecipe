#!/usr/bin/env bash

# shellcheck disable=SC1091,SC1090
source "${HOMERECIPE_SCRIPTS}"/util.sh

__error=''
__error_code=0
# Current implementation only assumes one possible Argument of -f

ARG="-s"
if [[ "$1" == '-f' ]]; then
  ARG="-sf"
fi

## Create symlinks to all dotfiles defined here under home directory
echo "Creating symlinks to git installed dotfiles..."
find "${HOMERECIPE_DIR}"/dotfiles \
    -maxdepth 1 -mindepth 1 \
    ! \( -name .git -o \
      -name README.md -o \
      -name .DS_Store \) \
    -exec ln "$ARG" {} "$HOME" \; 2> /tmp/dotfiles_setup.log

## Handle errors
__error=$(</tmp/dotfiles_setup.log)
if [ ! -z "$__error" ]; then
    __error_code=1
    echo "Warning: there was some error occurred while creating symlinks"
    cat /tmp/dotfiles_setup.log
    echo ""
else
    echo "Operation completed"
    echo ""
fi

## Clean up log file
rm /tmp/dotfiles_setup.log

[[ -f "$HOME"/.homerecipe ]] || ln -s "${HOMERECIPE_DIR}"/recipes/.homerecipe "$HOME"

exit $__error_code
