#
# Cookbook Name:: livegrep
# Recipe:: default
#
# Copyright 2014, Nelson Elhage
#
# All rights reserved - Do Not Redistribute
#

include_recipe "golang"
include_recipe "nelhage::mail"

include_recipe "livegrep::nginx"
include_recipe "nelhage::daemontools"
include_recipe "nelhage::users"
