# Path to your oh-my-zsh installation.
export ZSH="/Users/foreverd34d/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# zsh-vi-mode last-working-dir 
plugins=(zsh-autosuggestions fast-syntax-highlighting zoxide zsh-interactive-cd)

ZSH_AUTOSUGGEST_STRATEGY=(completion history)

ZSH_CACHE_DIR="$ZSH/cache"
ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"

source $ZSH/oh-my-zsh.sh

### User configuration ###

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Path
path+=( ~/.emacs.d/bin ~/bin ~/.local/bin ~/.spicetify )
export PATH

# Env variables
export LESSHISTFILE='-'
export EDITOR='nvim'
export HOMEBREW_NO_ENV_HINTS=1

# Aliases
alias v='nvim'
alias lsa='ls -a'
alias cbuild='gcc -Wall -Werror -Wpedantic -Wextra -Wfloat-conversion -Wfloat-equal -std=c99 -o app.exe main.c'
alias o='open'
alias owd='open ./'
alias fm='. ranger'
source "$HOME/.private.zsh"

# Exa aliases
alias ls='exa --icons'
alias la='exa -a --icons'
alias ll='exa -lah --icons'
alias l='exa -lh --icons'
alias tree='exa --tree --icons'

# Set fzf theme
export FZF_DEFAULT_OPTS='--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'
