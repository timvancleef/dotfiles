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
zstyle ':vcs_info:git:*' formats " (%F{010}%b%u%c%f)"
zstyle ':vcs_info:git:*' actionformats "(%F{010}%b (%a)%u%c%f"
add-zsh-hook precmd vcs_info

#
# Load nvm and node
#
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm

#
# Exports
#
export CLICOLOR=1
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';
export LC_MESSAGES=C
export LSCOLORS="gxfxcxdxbxegedabagacad"

#
# Aliases
#
DEV_BASE="/usr/local/Development"

alias la="ls -lA"
alias l="ls -l"

alias brew_update="brew update && brew upgrade && brew cleanup --prune all -s && brew doctor && brew missing"
alias dv="cd ${DEV_BASE}"
alias prodssh="ssh -vAND 9999 shell001.mo-mobile-prod.dus1.cloud"
alias git_clean="git branch --merged|grep -v '*'|xargs git branch -d"
alias start_mongo="docker run --rm -p 27017:27017 dockerhub.es.ecg.tools/mongo:4.2"
alias webapp="cd ${DEV_BASE}/ps-dealer-webapp"
alias dcs="cd ${DEV_BASE}/ps-dealer-care-service"

alias ..="cd .."
alias ...="cd ../.."

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias docker_wipe_all="docker system prune --all --volumes"
alias docker_wipe="docker system prune"

#
# Prompt
#
PROMPT='❯ %F{004}%2~%f${vcs_info_msg_0_} '
