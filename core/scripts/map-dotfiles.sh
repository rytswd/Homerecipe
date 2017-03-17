#!/usr/bin/env bash

# HOMERECIPE_SCRIPTS and HOMERECIPE_DIR need to be defined
# Assumed "cook" is called to run this script

[[ ! -z $HOMERECIPE_DIR ]] || { echo "\$HOMERECIPE_DIR is not found. Process exiting."; exit 1; }

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

exit $__error_code
