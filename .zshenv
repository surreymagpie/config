# this is the bare bones setup to move everything to XDG dir
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
