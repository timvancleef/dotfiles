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

function invia_kubectl() {
  IMAGE=invia/infrastructure-management-tools:latest
  docker pull ${IMAGE};
  docker run \
    --rm \
    -it \
    -v ${PWD}:/infra \
    -e SSO_AUTH_URL=https://aws-signin.l.invia.lan \
    -e KUBETOKEN_SSO_AUTH_URL=https://kube-signin.l.invia.lan/ \
    -e KUBETOKEN_NO_CHECK_CERTIFICATE=true \
    -e AWS_CREDENTIALS=no \
    -e K8S_CREDENTIALS=yes \
    -e USER=t.vancleef \
    -e TILLER_NAMESPACE=lighthouse \
    ${IMAGE}
}

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
