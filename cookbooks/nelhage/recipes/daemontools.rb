include_recipe "daemontools"

golang_package 'github.com/stripe/unilog'

directory '/etc/sv' do
  action :create
  owner 'root'
  group 'root'
  mode '0755'
end

service 'svscan' do
  provider Chef::Provider::Service::Upstart
  action :start
end
