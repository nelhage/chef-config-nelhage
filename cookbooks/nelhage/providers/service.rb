#
# Cookbook Name:: nelhage
# Provider:: service

def whyrun_supported?
  true
end

def load_current_resource
end

use_inline_resources

[:start, :stop, :status, :restart, :up, :down, :once, :pause, :cont, :hup, :alrm, :int, :term, :kill, :enable, :disable].each do |act|
  action act do
    create_daemontools_service
  end
end

def create_daemontools_service
  daemontools_service new_resource.service_name do
    directory "/etc/sv/#{new_resource.service_name}"
    cookbook 'nelhage'
    template 'generic'
    variables(:service => new_resource.service_name,
      :user    => new_resource.user,
      :command => new_resource.command)
    log true
    action new_resource.action
    owner new_resource.owner
    group new_resource.owner
    enabled new_resource.enabled
    running new_resource.running
  end
end
