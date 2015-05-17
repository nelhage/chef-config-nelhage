git '/home/nelhage/.rbenv' do
  repository "https://github.com/sstephenson/rbenv.git"
  user 'nelhage'
  group 'nelhage'
end

directory '/home/nelhage/.rbenv/plugins' do
  action :create
  owner 'nelhage'
  group 'nelhage'
end

git '/home/nelhage/.rbenv/plugins/ruby-build' do
  repository "https://github.com/sstephenson/ruby-build.git"
  user 'nelhage'
  group 'nelhage'
end

package 'libssl-dev' do
  action :upgrade
end

package 'libxml2-dev' do
  action :upgrade
end

execute "rbenv install #{node['nelhage']['ruby']['version']}" do
  user 'nelhage'
  environment(
    'HOME' => '/home/nelhage/',
    'PATH' => "/home/nelhage/.rbenv/bin/:#{ENV['PATH']}"
  )
  creates "/home/nelhage/.rbenv/versions/#{node['nelhage']['ruby']['version']}"
end

file '/home/nelhage/.rbenv/version' do
  action :create
  content "#{node['nelhage']['ruby']['version']}\n"
  owner 'nelhage'
  mode '0600'
end
