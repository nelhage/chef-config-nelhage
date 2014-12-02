include_recipe "nelhage"
include_recipe "nelhage::nginx"

apt_repository 'livegrep' do
  uri 'http://ppa.launchpad.net/nelhage/livegrep/ubuntu'
  distribution node['lsb']['codename']
  components ['main']
  keyserver "keyserver.ubuntu.com"
  key "C4053B4982A311903BC05433C1D03F5DD176C786"
  action :add
  notifies :run, "execute[apt-get update]", :immediately
end

["libjson0-dev", "libgflags-dev", "libgit2-dev", "libboost-dev",
  "libsparsehash-dev", "libboost-filesystem-dev",
  "libboost-system-dev", "build-essential", "cmake"].each do |package|
  package package do
    action :install
  end
end


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

git "/opt/livegrep/git" do
  repository 'git://github.com/livegrep/livegrep'
  user 'nelhage'
  group 'nelhage'
end

nelhage_service "livegrep" do
  command '/opt/services/livegrep/current/bin/livegrep -logtostderr -docroot /opt/services/livegrep/current/web /opt/livegrep/livegrep.json'
  user 'nelhage'
end

nelhage_service "livegrep-linux" do
  command "/opt/services/livegrep/current/bin/codesearch --load_index /opt/livegrep/linux.idx --listen tcp://127.0.0.1:#{node['livegrep']['linux']['port']}"
  user "nelhage"
end
