package "nodejs" do
  action [ :install, :upgrade ]
end

package "nodejs-legacy" do
  action [ :install, :upgrade ]
end

daemontools_service "money-srv" do
  directory "/etc/sv/money-srv"
  template 'money-srv'
  action [ :enable, :start ]
  log true
end
