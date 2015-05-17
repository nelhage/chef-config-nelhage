include_recipe "nelhage"
include_recipe "nelhage::login_packages"

file '/home/nelhage/.ssh/id_rsa' do
  action :create
  owner  'nelhage'
  mode   '0600'
  content node['nelhage']['users']['id_rsa']
end

include_recipe "nelhage::dotfiles"
include_recipe "nelhage::rbenv"
