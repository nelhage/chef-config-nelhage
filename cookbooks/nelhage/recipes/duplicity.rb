apt_repository 'duplicity' do
  uri 'http://ppa.launchpad.net/duplicity-team/ppa/ubuntu'
  distribution node['lsb']['codename']
  components ['main']
  keyserver "keyserver.ubuntu.com"
  key "AF953139C1DF9EF3476DE1D58F571BB27A86F4A2"
  action :add
  notifies :run, "execute[apt-get update]", :immediately
end

package 'duplicity' do
  action :install
end

python_pip 'boto' do
  action :install
end

template 'nightly-duplicity' do
  path '/usr/local/bin/nightly-duplicity'
  source 'nightly-duplicity.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

cron_d "duplicity" do
  action :create
  minute "0"
  hour   "12"
  command '/usr/local/bin/nightly-duplicity'
end
