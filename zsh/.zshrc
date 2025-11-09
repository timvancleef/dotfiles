#
# Init ZSH plugins
#
fpath=(~/.zsh/functions ~/.zsh/completion ~/.zsh/functions_local $fpath)
autoload -Uz compinit vcs_info add-zsh-hook

#
# Basic ZSH settings
#
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
zstyle ':completion:*' completer _complete
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' menu select
# zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
# zstyle ':completion:*' group-name ''
zstyle :compinstall filename '/Users/tvancleef/.zshrc'
compinit -i

#
# GIT integration
#
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats " (%F{142}%b%u%c%f)"
zstyle ':vcs_info:git:*' actionformats "(%F{142}%b (%a)%u%c%f)"
add-zsh-hook precmd vcs_info

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
# Homebrew
#
if [ -d "/opt/homebrew" ]; then
	export HOMEBREW_PREFIX="/opt/homebrew";
	export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
	export HOMEBREW_REPOSITORY="/opt/homebrew";
	export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
	export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
	export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
fi

export NVM_DIR="$HOME/.nvm"

#
# Load local exports
#
[ -r "$HOME/.zsh/zshrc.local" ] && source "$HOME/.zsh/zshrc.local"

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

function dv {
    if [ -x "$(command -v fd)" ] && [ -x "$(command -v fzf)" ]; then
        cd $(fd -d 3 -t d . $HOME/Development|fzf -e)
    else
        cd $HOME/Development
    fi
}
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
PROMPT='%F{109}%3~%f${vcs_info_msg_0_} '

#
# File manager
#
if type "nnn" > /dev/null; then
    autoload fm_nnn
    bindkey -s '^n' 'fm_nnn^M'
fi

#
# Custom functions
#
autoload -Uz $fpath[1]/*(.:t)

#
# Load npm completion
#
[ -r "$HOME/.zsh/npm-completion.sh" ] && source "$HOME/.zsh/npm-completion.sh"

#
# Load fzf history search
#
[ -r "$HOME/.zsh/fzf-zsh-bindings.sh" ] && FZF_ALT_C_COMMAND= FZF_CTRL_T_COMMAND= source "$HOME/.zsh/fzf-zsh-bindings.sh"

export PATH="$HOME/.local/bin${PATH:+:${PATH}}"
