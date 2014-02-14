#
# Cookbook Name:: tarsnap
# Recipe:: sources
#
# Copyright 2011,2012, ZephirWorks
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

binary_path = "#{node['tarsnap']['bin_dir']}/tarsnap"
tmpfile = "#{Chef::Config[:file_cache_path]}/tarsnap-autoconf-#{node['tarsnap']['version']}.tgz"

include_recipe "build-essential"

node['tarsnap']['packages'].each do |pkg|
  package pkg
end

remote_file tmpfile do
  source "https://www.tarsnap.com/download/tarsnap-autoconf-#{node['tarsnap']['version']}.tgz"
  checksum node['tarsnap']['checksum']
  not_if { File.exists?(binary_path) }
end

execute "unpack tarsnap" do
  cwd Chef::Config[:file_cache_path]
  command "tar xvzf #{tmpfile}"
  not_if { File.exists?(binary_path) }
end

execute "make and install tarsnap" do
  cwd "#{Chef::Config[:file_cache_path]}/tarsnap-autoconf-#{node['tarsnap']['version']}"
  command "./configure --sysconfdir=#{node['tarsnap']['conf_dir']} && make && make install"
  creates binary_path
end
