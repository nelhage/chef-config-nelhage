# include_recipe "nodejs"
package 'nodejs' do
  action :install
end

nelhage_service "money-srv" do
  command 'node /opt/services/nelhage.com-money/serve.js'
  user 'nelhage'
  rotate false
end
