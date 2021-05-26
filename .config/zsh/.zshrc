neofetch
HISTFILE=$XDG_CACHE_HOME/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000

# Ensure history file exists
#
mkdir -p $XDG_CACHE_HOME/zsh
touch $HISTFILE

setopt autocd
bindkey -e

zstyle :compinstall filename '/home/rob/.config/zsh/.zshrc'

autoload -Uz compinit promptinit; compinit ; promptinit
prompt adam1

source .config/aliases
