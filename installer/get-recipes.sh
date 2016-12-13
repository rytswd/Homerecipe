#!/bin/bash
# Temporary shell script to run bunch of scripts

# Get brew bundle (includes cask)
brew bundle dump --force --file=recipes/brew-recipe
# brew bundle --file=recipes/brew-recipe

# Get npm global recipe
# TODO: This is a workaround - there must be a better way...
\ls `npm root -g` > recipes/npm-recipe
# for i in `cat recipes/npm-recipe`; do npm install -g $i; done
