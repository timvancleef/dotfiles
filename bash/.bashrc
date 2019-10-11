for FILE in $(find -L .includes -depth 2 -type f); do
  source "$FILE"
done;

[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local
