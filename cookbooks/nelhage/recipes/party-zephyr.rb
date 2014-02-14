directory '/opt/services/party-zephyr' do
  owner 'nelhage'
  group 'nelhage'
end

python_virtualenv "/opt/services/party-zephyr/.virtualenv" do
  owner "nelhage"
  group "nelhage"
  action :create
end

template 'partychat.yaml' do
  owner 'nelhage'
  group 'nelhage'
  mode  '0600'
  action :create
  path '/opt/conf/partychat.yaml'
end

daemontools_service "party-zephyr" do
  directory "/etc/sv/party-zephyr"
  template 'generic'
  variables(:service => 'party-zephyr',
            :user => 'nelhage',
            :command => '/opt/services/party-zephyr/.virtualenv/bin/python /opt/services/party-zephyr/party-zephyr.py /opt/conf/partychat.yaml')
  action [ :enable, :start ]
  log true
end
