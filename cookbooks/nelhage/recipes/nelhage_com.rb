include_recipe "nelhage"

include_recipe "nelhage::websites"
include_recipe "nelhage::gitolite"
include_recipe "nelhage::money"
include_recipe "nelhage::party-zephyr"
include_recipe "nelhage::tarsnap"

include_recipe "nelhage::packages"

sysctl_param 'kernel.yama.ptrace_scope' do
  value '0'
end


file '/usr/local/bin/update-mongo-rss' do
  content <<EOF
#!/bin/sh
curl -so /opt/www/nelhage.com/files/mongo-p2-closed.rss 'https://jira.mongodb.org/sr/jira.issueviews:searchrequest-rss/temp/SearchRequest.xml?jqlQuery=project+%3D+SERVER+AND+resolution+%3D+Fixed+AND+%28+priority+%3D+%22Critical+-+P2%22++OR+priority+%3D+%22Blocker+-+P1%22%29&tempMax=1000'
EOF
  mode '755'
  owner 'nelhage'
  user 'nelhage'
end

cron_d "update-mongo-rss" do
  user 'nelhage'
  action :create
  minute "17"
  command '/usr/local/bin/update-mongo-rss'
end
