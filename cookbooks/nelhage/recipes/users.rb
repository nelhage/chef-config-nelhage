user "nelhage" do
  action :create
  uid     2000
  shell  '/bin/bash'
  supports :manage_home => true
end

directory '/home/nelhage/.ssh' do
  owner 'nelhage'
  mode '0700'
end

file '/home/nelhage/.ssh/authorized_keys' do
  owner   'nelhage'
  mode    '0600'
  content "#{node['nelhage']['ssh_keys'].join("\n")}\n"
end
