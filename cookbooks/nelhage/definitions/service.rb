service_params = {
  :user    => 'root',
  :command => nil,
  :action  => [ :enable, :start ],
  :owner   => 'root',
  :group   => 'root',
  :rotate  => true
}

define :nelhage_service, service_params do
  include_recipe "nelhage::daemontools"

  daemontools_service params[:name] do
    directory "/etc/sv/#{params[:name]}"
    cookbook 'nelhage'
    template 'generic'
    variables(:service => params[:name],
      :user    => params[:user],
      :command => params[:command])
    log true
    action params[:action]
    owner params[:owner]
    group params[:group]
  end

  if params[:rotate]
    name = params[:name]
    logrotate_app "daemontools-#{params[:name]}" do
      path       "/data/log/#{name}.log"
      frequency  'daily'
      rotate     365
      compress   true
      dateext    true
      postrotate "svc -h /etc/service/#{name}/log"
    end
  end
end
