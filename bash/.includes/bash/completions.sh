#!/usr/bin/env bash

for FILE in $(find completion.d -type f); do
  source "$FILE"
done;
