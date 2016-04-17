directory '/root/.aws' do
  action :create
  owner "root"
  group "root"
  mode "0700"
end

template 'aws_credentials' do
  path   "/root/.aws/credentials"
  source 'aws.credentials.erb'
  owner  'root'
  group  'root'
  mode   '0644'
end

template 'boto_credentials' do
  path   "/root/.boto"
  source 'boto.erb'
  owner  'root'
  group  'root'
  mode   '0644'
end

['/data/duplicity', '/data/duplicity/archive', '/data/duplicity/tmp'].each do |d|
  directory d do
    action :create
    owner 'root'
  end
end
