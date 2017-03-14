#!/usr/bin/env bash

# HOMERECIPE_SCRIPTS and HOMERECIPE_DIR need to be defined
# Assumed "cook" is called to run this script

[[ ! -z $HOMERECIPE_DIR ]] || { echo "\$HOMERECIPE_DIR is not found. Process exiting."; exit 1; }

echo "Removing existing dotfiles..."
find "${HOMERECIPE_DIR}/dotfiles/" -type f -name ".*" ! \( -name .private \) -ls -delete

echo "Removing existing recipes..."
find "${HOMERECIPE_DIR}/recipes/" -type f -name "*" -ls -delete
