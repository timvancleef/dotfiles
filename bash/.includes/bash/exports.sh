#!/usr/bin/env bash

export EDITOR=vim;

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';
export LC_MESSAGES=C

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
[[ -f /usr/libexec/java_home ]] && export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export LSCOLORS="gxfxcxdxbxegedabagacad"

export GOPATH="$HOME/Development/go"
export GOBIN="$HOME/Development/go/bin"
export PATH="$GOBIN:$PATH"

