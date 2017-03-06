#!/usr/bin/env bash

# Downloads oh-my-zsh https://github.com/robbyrussell/oh-my-zsh
#   confirmed as of March 2017
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Manual workaronud - it downloads some custom plugins and
#   add them in ~/.oh-my-zsh/ directory
git clone git://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM"/plugins/zsh-autosuggestions
