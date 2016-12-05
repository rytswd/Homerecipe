#!/bin/bash
# Temporary shell script to run bunch of scripts

# Get brew recipe
brew leaves > brew-recipe
# for i in `cat brew-recipe`; do brew install $i; done

# Get npm global recipe
# TODO: Add npm equivalent
