file '/home/nelhage/.ssh/id_rsa' do
  action :create
  owner  'nelhage'
  mode   '0600'
  content node['nelhage']['users']['id_rsa']
end

ssh_known_hosts_entry 'nelhage.com'

git '/home/nelhage/.dotfiles' do
  repository "git@nelhage.com:dotfiles"
  user 'nelhage'
  group 'nelhage'
end

execute 'scripts/sync-symlinks' do
  user 'nelhage'
  cwd '/home/nelhage/.dotfiles/'
  environment 'HOME' => '/home/nelhage/'
end
