#
# Cookbook Name:: nelhage
# Recipe:: default
#
# Copyright 2014, Nelson Elhage
#
# All rights reserved - Do Not Redistribute
#

include_recipe "golang"

include_recipe "nelhage::directories"

include_recipe "nelhage::mail"

include_recipe "nelhage::nginx"
include_recipe "nelhage::websites"
include_recipe "nelhage::gitolite"
include_recipe "nelhage::daemontools"
include_recipe "nelhage::money"
include_recipe "nelhage::party-zephyr"
include_recipe "nelhage::tarsnap"

include_recipe "nelhage::users"
include_recipe "nelhage::packages"


sysctl_param 'kernel.yama.ptrace_scope' do
  value '0'
end
