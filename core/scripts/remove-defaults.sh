#!/usr/bin/env bash

# shellcheck disable=SC1091,SC1090
source "${HOMERECIPE_SCRIPTS}"/util.sh

echo "WARNING - you are about to remove all dotfiles and recipes, even for other platforms."
echo "Current platform mode is set to: ${HOMERECIPE_MODE}"
echo
confirm "Do you really want to remove all dotfiles and recipes? [y/N]" || { echo "Remove cancelled"; exit; }

"${HOMERECIPE_SCRIPTS}"/remove-dotfiles.sh
"${HOMERECIPE_SCRIPTS}"/remove-recipes.sh
