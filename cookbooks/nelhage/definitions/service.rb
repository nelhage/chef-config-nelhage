service_params = {
  :user    => 'root',
  :command => nil,
  :action  => [ :enable, :start ],
}

define :nelhage_service, service_params do
  template "#{params[:name]}.service" do
    path "/etc/systemd/system/#{params[:name]}.service"
    source "systemd-service.erb"

    owner 'root'
    group 'root'
    mode '0644'

    variables :params => params
  end

  service params[:name] do
    provider Chef::Provider::Service::Systemd
    action params[:action]
  end
end
