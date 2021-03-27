autoload -U compinit colors vcs_info

# Report command running time if it is more than 3 seconds
REPORTTIME=3
# Keep a lot of history
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
# Add commands to history as they are entered, don't wait for shell to exit
#setopt INC_APPEND_HISTORY
# Do not keep duplicate commands in history
setopt HIST_IGNORE_ALL_DUPS
# Do not remember commands that start with a whitespace
setopt HIST_IGNORE_SPACE
# Correct spelling of all arguments in the command line
#setopt CORRECT_ALL
# Enable autocompletion

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/Users/tvancleef/.zshrc'

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' stagedstr ' %F{green}◉%f'
zstyle ':vcs_info:*' unstagedstr ' %F{yellow}⦿%f'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git*' formats "(%F{magenta}%b%f%u%c) "

fpath=(~/.zsh $fpath)

colors
compinit

_setup_ps1() {
  vcs_info
  GLYPH="❯"
  [ "x$KEYMAP" = "xvicmd" ] && GLYPH="❮"
  PS1="$GLYPH %F{blue}%~%f $vcs_info_msg_0_"
}
_setup_ps1

# Vi mode
zle-keymap-select () {
 _setup_ps1
  zle reset-prompt
}
zle -N zle-keymap-select
zle-line-init () {
  zle -K viins
}
zle -N zle-line-init
bindkey -v
export CLICOLOR=1
ls --color=auto &> /dev/null && alias ls='ls --color=auto'
bindkey '^R'      history-incremental-pattern-search-backward

export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';
export LC_MESSAGES=C
export LSCOLORS="gxfxcxdxbxegedabagacad"

alias brew_update="brew update && brew upgrade && brew cleanup --prune all -s && brew doctor && brew missing"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dv="cd ~/Development"
alias la="ls -lA"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias docker_wipe_all="docker system prune --all --volumes"
alias docker_wipe="docker system prune"
