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

nelhage_service "party-zephyr" do
  command '/opt/services/party-zephyr/.virtualenv/bin/python /opt/services/party-zephyr/party-zephyr.py /opt/conf/partychat.yaml'
  user 'nelhage'
  rotate false
end
