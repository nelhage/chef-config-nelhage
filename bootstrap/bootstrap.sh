#!/bin/sh

set -ex

hostname="$1"
chef="$(readlink -f "$(dirname $(readlink -f "$0"))/..")"

_ssh() {
    ssh -lroot "$hostname" "$@"
}

_ssh mkdir -p /etc/chef/repo

rsync -Pax "$chef/." root@"$hostname":/etc/chef/repo/

_ssh "touch /etc/chef/site.json && chmod 700 /etc/chef/site.json"
pw get nelhage.com/site.json | _ssh "cat > /etc/chef/site.json"
_ssh "sudo /etc/chef/repo/bootstrap/inner.sh"
