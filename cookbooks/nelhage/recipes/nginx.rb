#
# Cookbook Name:: nelhage
# Recipe:: nginx
#
# Copyright 2014, Nelson Elhage
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx::repo"
include_recipe "nginx"

template 'ssl.conf' do
  path   "#{node['nginx']['dir']}/conf.d/ssl.conf"
  source 'ssl.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :reload, 'service[nginx]'
end

template 'nginx-logs.conf' do
  path   "#{node['nginx']['dir']}/conf.d/nginx-logs.conf"
  source 'nginx-logs.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :reload, 'service[nginx]'
end

cookbook_file 'dhparam.pem' do
  path '/etc/ssl/certs/dhparam.pem'
  source 'dhparam.pem'
  owner 'root'
  group 'root'
  mode  '0644'
  notifies :reload, 'service[nginx]'
end

logrotate_app 'nginx' do
  cookbook 'logrotate'
  path ['/data/log/nginx/*.log']
  frequency 'daily'
  su 'www-data'
  dateext true
  delaycompress true
  missingok true
  compress true
  notifempty true
  rotate 1000
  sharedscripts true
  postrotate '
if [ -f /var/run/nginx.pid ]; then
  kill -USR1 `cat /var/run/nginx.pid`
fi
'
end
