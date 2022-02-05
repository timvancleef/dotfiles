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
# using Homebrew on Mac OSX
if [[ -x "$(command -v brew)" && -s "$(brew --prefix)/opt/nvm/nvm.sh" ]]; then
  export NVM_DIR="$HOME/.nvm"
  source "$(brew --prefix)/opt/nvm/nvm.sh"
fi

#
# Load npm completion
#
[ -x "$(command -v npm)" ] && source <(npm completion)

#
# Exports
#
export CLICOLOR=1
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';
export LC_MESSAGES=C
export LSCOLORS="gxfxcxdxbxegedabagacad"
export TERM=xterm-256color

#
# Aliases
#
alias la="ls -lAh"
alias l="ls -lh"

alias dv="cd ~/Development"

alias ..="cd .."
alias ...="cd ../.."

alias gst="git status"
alias gco="git checkout "
alias gc="git branch --merged|grep -v '*'|xargs git branch -d"
alias gf="git fetch --prune"
alias gl="git pull"
alias glo="git log --pretty=oneline -n 20 --graph --abbrev-commit"

alias docker_wipe_all="docker system prune --all --volumes"
alias docker_wipe="docker system prune"

alias npm_update_all="npm outdated --parseable | cut -f4 -d: | xargs npm i"

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

