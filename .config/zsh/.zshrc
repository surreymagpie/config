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
bindkey '\e[3~' delete-char
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line

zstyle :compinstall filename '/home/rob/.config/zsh/.zshrc'

autoload -Uz compinit promptinit; compinit ; promptinit
PROMPT="%F{154}%n%f@%F{white}%m%f%B%F{117} %~ %f%b%# "
RPROMPT="%?"

if [ -f $XDG_CONFIG_HOME/shell/aliases ]; then
	source $XDG_CONFIG_HOME/shell/aliases
fi

# Enable autosuggestions if installed
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
	source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Enable syntax highlighting if installed - MUST BE LAST
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
