#
# Cookbook Name:: livegrep
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
include_recipe "nelhage::daemontools"
include_recipe "nelhage::users"

include_recipe "livegrep::livegrep"
