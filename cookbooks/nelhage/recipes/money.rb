include_recipe "nodejs"

daemontools_service "money-srv" do
  directory "/etc/sv/money-srv"
  template 'generic'
  variables :service => 'money-srv',
            :user => 'nelhage',
            :command => 'node /opt/services/nelhage.com-money/serve.js'
  action [ :enable, :start ]
  log true
end
