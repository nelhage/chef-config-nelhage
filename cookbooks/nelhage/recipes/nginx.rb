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

file "#{node['nginx']['dir']}/sites-enabled/000-default" do
  action :delete
end

template 'ssl.conf' do
  path   "#{node['nginx']['dir']}/conf.d/ssl.conf"
  source 'ssl.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :reload, 'service[nginx]'
end

def nginx_site(domain)
  template domain do
    path   "#{node['nginx']['dir']}/conf.d/#{domain}.conf"
    source "#{domain}.conf.erb"
    owner  'root'
    group  'root'
    mode   '0644'
    notifies :reload, 'service[nginx]'
  end
end

nginx_site 'asciisnowmanforyou.com'
nginx_site 'nelhage.com'
nginx_site 'blog.nelhage.com'

file "/etc/ssl/certs/www.nelhage.com.pem" do
  content "#{node['nelhage']['ssl']['www.nelhage.com']}"
  owner   'root'
  group   'root'
  mode    '0600'
end

file "/etc/ssl/certs/blog.nelhage.com.pem" do
  content "#{node['nelhage']['ssl']['blog.nelhage.com']}"
  owner   'root'
  group   'root'
  mode    '0600'
end

directory '/opt/www' do
  action :create
  owner  'nelhage'
  group  'www-data'
  mode   '2755'
end
