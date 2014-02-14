#
# Cookbook Name:: tarsnap
# Recipe:: default
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

case node['platform']
when "freebsd"
  include_recipe "tarsnap::freebsd"
else
  include_recipe "tarsnap::sources"
end

template "tarsnap.conf" do
  path "#{node['tarsnap']['conf_dir']}/tarsnap.conf"
  source "tarsnap.conf.erb"
  owner "root"
  group 0
  mode 0600
end

keygen_cmd = "tarsnap-keygen --keyfile #{node['tarsnap']['private_key']} --machine #{node['fqdn']} --user <user>"
log "you must run tarsnap-keygen manually: '#{keygen_cmd}'" do
  level :warn
  not_if { ::File.exists?(node['tarsnap']['private_key']) && ::File.size?(node['tarsnap']['private_key']) }
end
