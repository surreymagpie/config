# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory for ZInit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d $ZINIT_HOME ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load ZInit
source "${ZINIT_HOME}/zinit.zsh"

# Ensure history file exists
HISTFILE=$XDG_CACHE_HOME/zsh/histfile
# mkdir -p $XDG_CACHE_HOME/zsh && touch $HISTFILE
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase

setopt appendhistory
setopt autocd
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt sharehistory

# Set up Powerlevel 10k prompt
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Set up zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add snippets here
# zinit snippet OMZP::aliases
zinit snippet OMZP::composer
zinit snippet OMZP::sudo

# Add directory for custom completions if any
fpath=(/usr/share/zsh/vendor-completions $ZDOTDIR/completions $fpath)

# Load completions
autoload -U compinit && compinit

# Load bash completions for rpm-ostree
if [[ -f /usr/share/bash-completion/completions/rpm-ostree ]]; then
  autoload -Uz bashcompinit && bashcompinit
  source /usr/share/bash-completion/completions/rpm-ostree
fi

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Keybindings
bindkey -e
bindkey '\e[3~' delete-char
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Load common environment
source $XDG_CONFIG_HOME/shell/profile
source $XDG_CONFIG_HOME/shell/aliases

# Shell integrations
eval "$(fzf --zsh)"

# Load `direnv` if installed
if [ $(command -v direnv) ]; then
    eval "$(direnv hook zsh)"
fi

