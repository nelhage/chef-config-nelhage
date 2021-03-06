include_recipe "tarsnap"
include_recipe "cron"

# exec /usr/local/bin/tarsnap  --keyfile /root/tarsnap.key --cachedir /data/tarsnap.cache/ -c -f "nelhage.com-$(date +%Y%m%d-%H%M)" /data/archived /data/backup

directory '/etc/tarsnap/' do
  action :create
  owner 'root'
  group 'root'
  mode  '0700'
end

file '/etc/tarsnap/tarsnap.key' do
  owner 'root'
  group 'root'
  mode  '0600'
  content "#{node['nelhage']['tarsnap']['key']}\n"
end

directory '/data/tarsnap.cache' do
  action :create
  owner 'root'
  group 'root'
  mode  '0700'
end

template 'nightly-tarsnap' do
  path '/usr/local/bin/nightly-tarsnap'
  source 'nightly-tarsnap.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

cron_d "tarsnap" do
  action :create
  minute "0"
  hour   "12"
  command '/usr/local/bin/nightly-tarsnap'
end
