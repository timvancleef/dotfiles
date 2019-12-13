#!/usr/bin/env bash

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local host="${2:-127.0.0.1}";
	local port="${1:-8000}";
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python3 -m http.server "$port" --bind "$host"
}

function hotfix() {
  local cmd="git checkout -b \"hotfix/NO-TICKET-$1\" && git commit -am \"$2\" && git push --set-upstream origin \"hotfix/NO-TICKET-$1\""
  echo $cmd
  eval $cmd
}

function feature() {
  local cmd="git checkout -b \"feature/$1\" && git commit -am \"$2\" && git push --set-upstream origin \"feature/$1\""
  echo $cmd
  eval $cmd
}
