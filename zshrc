# P10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

fpath+=("$XDG_CACHE_HOME"/zsh_completions)

##
## Plugins
##

ZIM_HOME="$XDG_CACHE_HOME"/zim
ZIM_CONFIG_FILE="$XDG_CONFIG_HOME/zimrc"
# TODO: Add paths for linux
ZIM_PATH=$(brew --prefix)/opt/zimfw/share

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source "$ZIM_PATH"/zimfw.zsh init
fi

ZSH_AUTOSUGGEST_STRATEGY=(completion history)

zstyle ':zim:input' double-dot-expand yes
zstyle ':zim' 'disable-version-check' 'true'

# Initialize modules.
source ${ZIM_HOME}/init.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zimfw/utility inserts --no-init to less options which breaks scrollback,
# so we remove that
export LESS=${LESS//--no-init}

##
## User configuration
##

#
# Aliases
#

# general aliases
alias v='nvim'                  # Neovim shortcut
alias vv='neovide'              # Neovide shortcut
alias o='open'                  # macOS open shortcut
alias owd='open ./'             # Open current dir in Finder (macOS)
alias fhistory='history | rg'   # Searches history
alias md='mkdir -p'
alias pdb='python3.12 -m pdb'   # Python debugger shortcut
alias zathura='open -a /Applications/Zathura.app/Contents/MacOS/zathura'

# Yazi alias (cd after exit)
function fm() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# git aliases
alias gl='git log --graph --abbrev-commit --decorate --date=relative --all'
alias glo='git log --oneline --graph --abbrev-commit --decorate --date=relative --all'
alias gst='git status --short --find-renames --branch'
alias gstu='git status --short --find-renames --branch --untracked-files'
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gd='git diff'

# exa aliases
alias ls='eza --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias lsa='eza -a --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first'
alias l='eza -lh --icons --group-directories-first'
alias tree='eza --tree --icons --group-directories-first'

# yabai shortcuts
alias yrestart='yabai --restart-service'
alias ystop='yabai --stop-service'
alias ystart='yabai --start-service'

# sketchybar shortcuts
alias skreload='sketchybar --reload'

#
# Set fzf theme
#

# Catppuccin mocha
export FZF_DEFAULT_OPTS='--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'

# Catppuccin frappe
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
# --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
# --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

# # Onedark
# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
# " --color=bg+:#353b45,bg:#282c34,spinner:#56b6c2,hl:#61afef"\
# " --color=fg:#565c64,header:#61afef,info:#e5c07b,pointer:#56b6c2"\
# " --color=marker:#56b6c2,fg+:#b6bdca,prompt:#e5c07b,hl+:#61afef"
