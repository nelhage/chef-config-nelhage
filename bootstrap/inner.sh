#!/bin/sh

set -ex

curl -L https://www.opscode.com/chef/install.sh | bash

cat > ~ubuntu/solo.rb <<EOF
file_cache_path "/home/ubuntu/chef-solo/"
cookbook_path "/home/ubuntu/chef-repo/cookbooks"
EOF

chef-solo -c ~ubuntu/solo.rb -j ~ubuntu/site.json
