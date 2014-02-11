include_recipe "daemontools"

golang_package 'github.com/nelhage/daemonlogger'

directory '/etc/sv' do
  action :create
  owner 'root'
  group 'root'
  mode '0755'
end