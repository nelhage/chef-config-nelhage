# include_recipe "nodejs"
package 'nodejs' do
  action :install
end

nelhage_service "money-srv" do
  command '/usr/bin/nodejs /opt/services/nelhage.com-money/serve.js'
  user 'nelhage'
end
