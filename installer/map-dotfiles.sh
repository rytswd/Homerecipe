#!/bin/bash
# Temporary shell script to run bunch of scripts
__error=''
__error_code=0
# Current implementation only assumes one possible argument of -f
exec_command='ln -s'
if [ ! -z $1 ] && [ $1 == '-f' ]; then
  exec_command='ln -sf'
fi

## Create symlinks to all dotfiles defined here under home directory
echo "Creating symlinks to git installed dotfiles..."
find ${PWD}/dotfiles \
    -maxdepth 1 -mindepth 1 \
    ! \( -name .git -o \
      -name README.md -o \
      -name .DS_Store \) \
    -exec $exec_command {} ~ \; 2> /tmp/dotfiles_setup.log

## Handle errors
__error=$(</tmp/dotfiles_setup.log)
if [ ! -z "$__error" ]; then
    __error_code=1
    echo "Error: there was some error occurred while creating symlinks"
    cat /tmp/dotfiles_setup.log
    echo ""
else
    echo "Operation completed"
    echo ""
fi

## Clean up log file
rm /tmp/dotfiles_setup.log

exit $__error_code
