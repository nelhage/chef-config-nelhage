#!/bin/sh

set -ex

hostname="$1"
chef="$(readlink -f "$(dirname $(readlink -f "$0"))/..")"

_ssh() {
    ssh -lroot "$hostname" "$@"
}

_ssh mkdir -p /etc/chef/repo

rsync -Pax "$chef/." "$hostname":/etc/chef/repo/

pw get nelhage.com/site.json | _ssh "cat > /etc/chef/site.json"
_ssh "sudo /home/ubuntu/chef-repo/bootstrap/inner.sh"
