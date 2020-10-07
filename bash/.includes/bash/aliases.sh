#!/usr/bin/env bash

if [ $(uname -s) = "Darwin" ]; then
  alias ls="ls -G"
  alias brew_update="brew update && brew upgrade && brew cleanup --prune all -s && brew doctor && brew missing"
else
  alias ls="ls --color=auto"
fi

alias l="ls -l"
alias ll="ls -lA"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dv="cd ~/Development"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias week="date +%V"
alias localip="ipconfig getifaddr en0"
alias nettop_external="nettop -c -t external"
alias npm_update="npm install npm -g && npm update -g"
alias mute="osascript -e 'set volume output muted true'"
alias unmute="osascript -e 'set volume output muted false'"
alias docker_wipe_all="docker system prune --all --volumes"
alias docker_wipe="docker system prune"

# Normalize `open` across Linux, macOS, and Windows.
# This is needed to make the `o` function (see below) cross-platform.
if [ ! $(uname -s) = 'Darwin' ]; then
	if grep -q Microsoft /proc/version; then
		# Ubuntu on Windows using the Linux subsystem
		alias open='explorer.exe';
	else
		alias open='xdg-open';
	fi
fi
