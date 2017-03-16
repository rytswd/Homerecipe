#!/usr/bin/env bash

PL_FONTS_SHA='e13f86bf4dbd34495510694ead9ba76f4241d2e7'
PL_FONTS_DIR="$HOME/Library/Fonts" # macOS location

sha=$(test -f "${PL_FONTS_DIR}" && tar -c "${PL_FONTS_DIR}" | openssl sha1)
[[ "$PL_FONTS_SHA" == "$sha" ]] || { echo "Powerline Fonts are already installed. Skipping."; exit 0; } 
git clone https://github.com/powerline/fonts.git /tmp/powerline-fonts
/tmp/fonts/install.sh
rm -rf /tmp/powerline-fonts
