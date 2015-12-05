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

cookbook_file 'dhparam.pem' do
  path '/etc/ssl/certs/dhparam.pem'
  source 'dhparam.pem'
  owner 'root'
  group 'root'
  mode  '0644'
  notifies :reload, 'service[nginx]'
end
