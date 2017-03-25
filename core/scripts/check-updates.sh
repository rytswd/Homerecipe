#!/usr/bin/env bash

# HOMERECIPE_SCRIPTS and HOMERECIPE_DIR need to be defined
# Assumed "cook" is called to run this script

[[ ! -z $HOMERECIPE_DIR ]] || { echo "\$HOMERECIPE_DIR is not found. Process exiting."; exit 1; }

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
