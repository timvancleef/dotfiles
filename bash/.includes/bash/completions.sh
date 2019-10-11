#!/usr/bin/env bash

for FILE in $(find .includes/bash/completion.d -type f); do
  source "$FILE"
done;
