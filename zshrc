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
if [[ $(uname) == 'Darwin' ]]; then
    ZIM_PATH=$(brew --prefix)/opt/zimfw/share
else
    ZIM_PATH=$XDG_CACHE_HOME/zimfw
fi

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source "$ZIM_PATH"/zimfw.zsh init
fi

ZSH_AUTOSUGGEST_STRATEGY=(completion history)

zstyle ':zim:input' double-dot-expand yes
zstyle ':zim' 'disable-version-check' 'true'

# Init fzf through ZVM
zvm_after_init_commands+=('source <(fzf --zsh)')

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

# alias fm='. ranger'

# Yazi alias (cd after exit)
function fm {
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

# homebrew
alias brewa='brew autoremove'
alias brewc='brew cleanup'
alias brewC='brew cleanup -s'
alias brewd='brew doctor --verbose'
alias brewe='brew edit --formula'
alias brewi='brew info --formula'
alias brewI='brew install --formula'
alias brewl='brew list --formula'
alias brewL='brew leaves'
alias brewo='brew outdated --formula'
alias brewr='brew reinstall --formula'
alias brews='brew search --formula'
alias brewS='brew services'
alias brewu='brew update'
alias brewU='brew upgrade --formula'
alias brewx='brew uninstall --formula'
alias brewX='brew uninstall --formula --force'

# homebrew cask
alias caske='brew edit --cask'
alias caski='brew info --cask'
alias caskI='brew install --cask'
alias caskl='brew list --cask'
alias casko='brew outdated --cask'
alias caskr='brew reinstall --cask'
alias casks='brew search --cask'
alias caskU='brew upgrade --cask'
alias caskx='brew uninstall --cask'
alias caskX='brew uninstall --cask --force'
alias caskz='brew uninstall --cask --zap'

# yabai shortcuts
alias yrestart='yabai --restart-service'
alias ystop='yabai --stop-service'
alias ystart='yabai --start-service'

# sketchybar shortcuts
alias skreload='sketchybar --reload'

if [[ $(uname) == 'Darwin' ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

#
# fzf config
#

export FZF_THEME_CTP_MOCHA=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"

export FZF_THEME_CTP_FRAPPE=" \
--color=bg+:#414559,bg:#303446,spinner:#F2D5CF,hl:#E78284 \
--color=fg:#C6D0F5,header:#E78284,info:#CA9EE6,pointer:#F2D5CF \
--color=marker:#BABBF1,fg+:#C6D0F5,prompt:#CA9EE6,hl+:#E78284 \
--color=selected-bg:#51576D \
--color=border:#414559,label:#C6D0F5"

export FZF_THEME_ONEDARK=" \
--color=bg+:#353b45,bg:#282c34,spinner:#56b6c2,hl:#61afef \
--color=fg:#565c64,header:#61afef,info:#e5c07b,pointer:#56b6c2 \
--color=marker:#56b6c2,fg+:#b6bdca,prompt:#e5c07b,hl+:#61afef"

export FZF_DEFAULT_OPTS="$FZF_THEME_CTP_MOCHA"
bindkey -M viins '^R' fzf-history-widget
