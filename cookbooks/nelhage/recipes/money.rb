include_recipe "nodejs"

nelhage_service "money-srv" do
  command 'node /opt/services/nelhage.com-money/serve.js'
  user 'nelhage'
  rotate false
end
