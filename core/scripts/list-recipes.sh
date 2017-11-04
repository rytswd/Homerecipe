#!/usr/bin/env bash

# shellcheck disable=SC1091,SC1090
source "${HOMERECIPE_SCRIPTS}"/util.sh

# a quick way to list all files and their contents - nothing sophisticated

find "${HOMERECIPE_DIR}/recipes" \
  -type f \
  -name "*-recipe" \
  ! \( -name macos-recipe \) \
  -exec sh -c 'file="$1"; ls "$file"; cat "$file"; echo ""' _ {} \;
  # macos-recipe is too long to simply cat out
