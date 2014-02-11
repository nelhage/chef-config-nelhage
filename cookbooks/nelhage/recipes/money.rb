include_recipe "nodejs"

daemontools_service "money-srv" do
  directory "/etc/sv/money-srv"
  template 'money-srv'
  action [ :enable, :start ]
  log true
end
