#!/usr/bin/env bash

# Downloads oh-my-zsh https://github.com/robbyrussell/oh-my-zsh

# The below shell script assumes you are running interactively,
#   which is not ideal to wrap it with other scripts
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

[[ -d ~/.oh-my-zsh ]] && { echo ".oh-my-zsh already exists, skipping zsh setup"; exit 0; }
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s "$(grep /zsh$ /etc/shells | tail -1)"

# Manual workaronud - it downloads some custom plugins and
#   add them in ~/.oh-my-zsh/ directory
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
