directory '/opt/www' do
  action :create
  owner  'nelhage'
  group  'www-data'
  mode   '2755'
end

directory '/opt/services' do
  action :create
  owner  'nelhage'
  group  'nelhage'
  mode   '755'
end

directory '/opt/conf' do
  action :create
  owner  'nelhage'
  group  'nelhage'
  mode   '755'
end

directory '/data/log' do
  action :create
  owner  'root'
  group  'root'
  mode   '755'
end

directory '/data/backup' do
  action :create
  owner 'root'
  group 'root'
  mode  '1777'
end
