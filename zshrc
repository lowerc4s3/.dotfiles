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
plugins=(zsh-autosuggestions fast-syntax-highlighting zoxide)

ZSH_AUTOSUGGEST_STRATEGY=(completion history)

ZSH_CACHE_DIR="$ZSH/cache"
ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

##
## User configuration
##

# Path
path+=( ~/.emacs.d/bin ~/bin ~/.local/bin ~/.spicetify )
PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH

# Env variables
export LESSHISTFILE='-'
export EDITOR='nvim'
export HOMEBREW_NO_ENV_HINTS=1
export ASAN_OPTIONS=detect_leaks=1

#
# Aliases
#

# General aliases
alias v='nvim'                  # Neovim shortcut
alias o='open'                  # macOS open shortcut
alias owd='open ./'             # Open current dir in Finder (macOS)
alias fm='. ranger'             # Ranger shortcut (switches dir when leaving ranger)
alias fhistory='history | rg'   # Searches history
alias info='info --vi-keys'     # Enables vi keybindigs in info
alias vc='v *.c'                # Opens all C files in cwd
alias vch='v *.h *.c'           # Opens all C and header files in cwd
alias pdb='python3 -m pdb'      # Python debugger shortcut

source "$HOME/.private.zsh"

# Git aliases
alias gl='git log --graph --abbrev-commit --decorate --date=relative --all'
alias glo='git log --oneline --graph --abbrev-commit --decorate --date=relative --all'
alias gst='git status --short --find-renames --branch'
alias gstu='git status --short --find-renames --branch --untracked-files'
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gd='git diff'

# Exa aliases
alias ls='exa --icons --group-directories-first'
alias la='exa -a --icons --group-directories-first'
alias lsa='exa -a --icons --group-directories-first'
alias ll='exa -lah --icons --group-directories-first'
alias l='exa -lh --icons --group-directories-first'
alias tree='exa --tree --icons --group-directories-first'

#
# Set fzf theme
#

# Catppuccin mocha
# export FZF_DEFAULT_OPTS='--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'

# Onedark
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:#353b45,bg:#282c34,spinner:#56b6c2,hl:#61afef"\
" --color=fg:#565c64,header:#61afef,info:#e5c07b,pointer:#56b6c2"\
" --color=marker:#56b6c2,fg+:#b6bdca,prompt:#e5c07b,hl+:#61afef"
