# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for FILE in $(find -L .includes -maxdepth 2 -type f); do
  source "$FILE"
done;

[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local
