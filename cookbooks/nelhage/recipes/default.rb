#
# Cookbook Name:: nelhage
# Recipe:: default
#
# Copyright 2014, Nelson Elhage
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nelhage::nginx"
include_recipe "nelhage::packages"
include_recipe "nelhage::gitolite"

include_recipe "golang"
golang_package 'github.com/nelhage/daemonlogger'

include_recipe "nelhage::users"
