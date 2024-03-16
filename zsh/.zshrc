#
# Init ZSH plugins
#
autoload -Uz compinit vcs_info add-zsh-hook
fpath=(~/.zsh $fpath)

#
# Basic ZSH settings
#
bindkey '^R' history-incremental-pattern-search-backward

REPORTTIME=3
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

setopt NO_CASE_GLOB
setopt GLOB_COMPLETE
setopt AUTO_CD
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt PROMPT_SUBST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

#
# ZSH Completion
#
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/Users/tvancleef/.zshrc'
compinit

#
# GIT integration
#
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats " (%F{003}%b%u%c%f)"
zstyle ':vcs_info:git:*' actionformats "(%F{003}%b (%a)%u%c%f)"
add-zsh-hook precmd vcs_info

#
# Load nvm and node
#
export NVM_DIR="$HOME/.nvm"
# using Homebrew on Mac OSX
if [[ -x "$(command -v brew)" && -s "$(brew --prefix)/opt/nvm/nvm.sh" ]]; then
  source "$(brew --prefix)/opt/nvm/nvm.sh"
else
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
fi

#
# Load npm completion
#
[ -r "$HOME/.zsh/npm-completion.sh" ] && source "$HOME/.zsh/npm-completion.sh"

#
# Load kubectl completion
#
[ -r "$HOME/.zsh/kubectl-completion.sh" ] && source "$HOME/.zsh/kubectl-completion.sh"

#
# Load bw completion
#
[ -r "$HOME/.zsh/bw-completion.sh" ] && source "$HOME/.zsh/bw-completion.sh" && compdef _bw bw

#
# Load local exports
#
[ -r "$HOME/.zsh/zshrc.local" ] && source "$HOME/.zsh/zshrc.local"

#
# Exports
#
export CLICOLOR=1
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';
export LC_MESSAGES=C
export LSCOLORS="gxfxcxdxbxegedabagacad"
#export TERM=xterm-256color
export EDITOR=nvim;

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

#
# Aliases
#
if [ $(uname -s) = "Darwin" ]; then
  alias ls="ls -G"
  alias mute="osascript -e 'set volume output muted true'"
  alias unmute="osascript -e 'set volume output muted false'"
else
  alias ls="ls --color=auto"
fi

alias la="ls -lAh"
alias l="ls -lh"

if [ -n "$DEV_BASE" ]; then
  alias dv="cd $DEV_BASE"
else
  alias dv="cd $HOME/Development"
fi
alias dl="cd $HOME/Downloads"
alias dt="cd $HOME/Desktop"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias ..="cd .."
alias ...="cd ../.."

alias gst="git status"
alias gco="git checkout "
alias gc="git branch --merged|grep -v '*'|xargs git branch -d"
alias gf="git fetch --prune"
alias gl="git pull"
alias glo="git log --pretty=oneline -n 20 --graph --abbrev-commit"
alias gs="git switch"

alias docker_wipe_all="docker system prune --all --volumes && docker volume prune --all"
alias docker_wipe="docker system prune && docker volume prune"

alias npm_update_all="npm outdated --parseable | cut -f4 -d: | xargs npm i"

alias iso_datetime="date +%Y-%m-%dT%H%M%S"
alias disk_usage="du -sh * 2>/dev/null | sort -h"


# Normalize `open` across Linux, macOS, and Windows.
# This is needed to make the `o` function (see below) cross-platform.
if ! [ $(uname -s) = 'Darwin' ]; then
	if grep -q Microsoft /proc/version; then
		# Ubuntu on Windows using the Linux subsystem
		alias open='explorer.exe';
	else
		alias open='xdg-open';
	fi
fi

#
# Prompt
#
PROMPT='$ %F{010}%2~%f${vcs_info_msg_0_} '

#
# Frunctions
#
function color_palette {
	for i in {0..255} ; do
		printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
		if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
			printf "\n";
		fi
	done
}

function update_npm_completion {
  [ -x "$(command -v npm)" ] && npm completion > "$HOME/.zsh/npm-completion.sh"
}

function update_kubectl_completion {
  [ -x "$(command -v kubectl)" ] && kubectl completion zsh > "$HOME/.zsh/kubectl-completion.sh"
}

function update_brew {
  [ -n "$(command -v update_brew_preflight)" ] && brew_update_preflight
  [ -x "$(command -v brew)" ] && brew update && brew upgrade && brew cleanup --prune=30 && brew autoremove &&  brew doctor && brew missing;
}

function update_repos {
    find . -maxdepth 1 -mindepth 1 -type d | while read dir; do
        echo "--- Updating ${dir}"
        cd "$dir"
        git switch main && git fetch --prune && git pull && git branch --merged|grep -v '*'|xargs git branch -d
        cd ..
        echo "---"
    done
}

function update_node {
  if [[ -x "$(command -v brew)" && -s "$(brew --prefix)/opt/nvm/nvm.sh" ]]; then
      nvm install --lts
  else
      [ -s "$NVM_DIR/nvm.sh" ] && nvm install --lts
  fi
  [ -x "$(command -v npm)" ] && npm outdated -g
}

function update_kubectl_krew {
  [ -x "$(command -v kubectl)" ] && kubectl krew update && kubectl krew upgrade
}

function update_tfenv {
  [ -x "$(command -v tfenv)" ] && tfenv version-name && echo "---" && tfenv list-remote | grep -v "-" | head -n 2
}

function update_bw_completion {
  [ -x "$(command -v bw)" ] && bw completion --shell zsh > "$HOME/.zsh/bw-completion.sh"
}

