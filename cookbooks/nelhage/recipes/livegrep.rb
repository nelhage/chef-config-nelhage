include_recipe "nelhage"
include_recipe "nelhage::nginx"

directory '/opt/services/livegrep' do
  action :create
  owner  'nelhage'
  group  'www-data'
  mode   '2755'
end

template 'livegrep.com' do
  path   "#{node['nginx']['dir']}/conf.d/livegrep.com.conf"
  source "livegrep.com.conf.erb"
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :reload, 'service[nginx]'
end


directory '/opt/livegrep/' do
  action :create
  owner  'nelhage'
  group  'www-data'
  mode   '755'
end

template 'linux-index.json' do
  path '/opt/livegrep/linux-index.json'
  action :create
  mode '644'
end

template 'livegrep.json' do
  path '/opt/livegrep/livegrep.json'
  action :create
  mode '644'
end

template 'rebuild-index' do
  path '/opt/livegrep/rebuild-index'
  action :create
  mode '755'
end

git "/opt/livegrep/linux" do
  repository 'http://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git'
end

nelhage_service "livegrep" do
  command '/opt/services/livegrep/current/livegrep -logtostderr -docroot /opt/services/livegrep/current/web /opt/livegrep/livegrep.json'
  user 'nelhage'
end

nelhage_service "livegrep-linux" do
  command "/opt/services/livegrep/current/codesearch --load_index /opt/livegrep/linux.idx --listen tcp://127.0.0.1:#{node['livegrep']['linux']['port']}"
  user "nelhage"
end
