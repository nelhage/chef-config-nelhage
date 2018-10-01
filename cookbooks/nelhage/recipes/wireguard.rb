apt_repository 'wireguard' do
  uri 'http://ppa.launchpad.net/wireguard/wireguard/ubuntu'
  distribution node['lsb']['codename']
  components ['main']
  keyserver "keyserver.ubuntu.com"
  key "E1B39B6EF6DDB96564797591AE33835F504A1A25"
  action :add
  notifies :run, "execute[apt-get update]", :immediately
end

package 'wireguard' do
  action :upgrade
end
