# shellcheck disable=2148,1090

## Bash setup
# Set bash PS1
function __prompt_command {
  local r="$?"
  PS1="[ "

  # color definitions
  local red
  red="\[$(tput setaf 1)\]"
  local cyan
  cyan="\[$(tput setaf 6)\]"
  local white
  white="\[$(tput setaf 7)\]"
  local d
  d="\[$(tput sgr0)\]"
  PS1+="$white\u$d $cyan@$d $white\h$d ] \w "

  # use dirs -0 to replace with tilde
  local current
  current=$(dirs -0)
  local len=$(( $(tput cols) - ${#USER} - ${#HOSTNAME} - 12 - ${#current}))

  if [ $r != 0 ]; then
      PS1+="$red[ret:$r] "
      len=$((len - 7 - ${#r}))
  fi

  # fill with dashes
  if [ $len -gt 0 ]; then
    PS1+="$(printf '\u2500%.0s' $(seq 1 $len))"
  fi

  PS1+="$d $white\t$d\n\\$ $d"
}
PROMPT_COMMAND=__prompt_command

# Load other dotfiles
source ~/.dotbundle

complete -C /usr/local/bin/vault vault
