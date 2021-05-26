neofetch

# Ensure history file exists
HISTFILE=$XDG_CACHE_HOME/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
mkdir -p $XDG_CACHE_HOME/zsh
touch $HISTFILE

# Load vim configuration from my config path
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

setopt autocd
bindkey -e

zstyle :compinstall filename '/home/rob/.config/zsh/.zshrc'

autoload -Uz compinit promptinit; compinit ; promptinit
prompt adam1

source .config/aliases

# Enable autosuggestions if installed
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
	source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Enable syntax highlighting if installed - MUST BE LAST
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

