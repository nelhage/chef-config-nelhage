#!/bin/sh

set -ex

hostname="$1"
chef="$(readlink -f "$(dirname $(readlink -f "$0"))/..")"

_ssh() {
    ssh -lubuntu -i ~/.ssh/aws/id_rsa-us-west-2 "$hostname" "$@"
}

_ssh mkdir -p chef-repo

rsync --rsh='ssh -i /home/nelhage/.ssh/aws/id_rsa-us-west-2' -Pax "$chef/." ubuntu@"$hostname":chef-repo/

pw get nelhage.com/site.json | _ssh "cat > site.json"
_ssh "sudo /home/ubuntu/chef-repo/bootstrap/inner.sh"
