#!/bin/bash
# Temporary shell script to run bunch of scripts

## Cook recipes
# Homebrew
brew bundle --file=recipes/brew-recipe
# npm - manual workaround
for i in `cat recipes/npm-recipe`; do npm install -g $i; done
