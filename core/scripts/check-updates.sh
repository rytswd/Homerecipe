#!/usr/bin/env bash

# shellcheck disable=SC1091,SC1090
source "${HOMERECIPE_SCRIPTS}"/util.sh

cd "$HOMERECIPE_DIR" >/dev/null || { echo "Error: cd failed, could not locate $HOMERECIPE_DIR"; exit 1; }

# This script uses the logic explained in here:
#   http://stackoverflow.com/a/3278427/7153181

git fetch &> /dev/null

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [[ ! -z $(git status --porcelain) ]]; then
  confirm "Some updates found - do you want to save, and push back to the server? [y/N]" && { git add .; git commit -m "Update with script"; git push; }
elif [ "$LOCAL" = "$REMOTE" ]; then
  echo "Homerecipe up-to-date! :)"
elif [ "$LOCAL" = "$BASE" ]; then
  confirm "Recipes/dotfiles out of date - do you want to get the latest? [y/N]" && { git pull; }
elif [ "$REMOTE" = "$BASE" ]; then
  confirm "Some updates found, which need to be pushed - do you want to go ahead and push? [y/N]" && { git push; }
else
  echo "Homerecipe found to be diverged... Please resolve manually using git commands"
fi
