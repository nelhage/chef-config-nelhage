include_recipe "daemontools"

golang_package 'github.com/stripe/unilog'

directory '/etc/sv' do
  action :create
  owner 'root'
  group 'root'
  mode '0755'
end

if node['lsb']['release'] < '15.10'
  service 'svscan' do
    provider Chef::Provider::Service::Upstart
    action :start
  end
else
  service 'daemontools' do
    provider Chef::Provider::Service::Systemd
    action :start
  end
end
