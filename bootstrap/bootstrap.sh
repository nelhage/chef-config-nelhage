#!/bin/bash

set -ex

hostname="$1"
site="${2-$hostname}"
readlink=readlink
if type greadlink >&/dev/null; then
    readlink=greadlink
fi
chef="$($readlink -f "$(dirname $($readlink -f "$0"))/..")"

if ! [ "ok" = "$(ssh -lroot "$hostname" echo ok)" ]; then
    ssh -lubuntu "$hostname" sudo tee /root/.ssh/authorized_keys < ~/.ssh/id_rsa.pub
fi

_ssh() {
    ssh -lroot "$hostname" "$@"
}

_ssh mkdir -p /etc/chef/repo

rsync --delete -Pax "$chef/." root@"$hostname":/etc/chef/repo/

_ssh "touch /etc/chef/site.json && chmod 700 /etc/chef/site.json"
pw get "$site/site.json" | _ssh "cat > /etc/chef/site.json"
_ssh "sudo /etc/chef/repo/bootstrap/inner.sh"
