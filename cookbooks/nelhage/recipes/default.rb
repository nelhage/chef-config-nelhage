#
# Cookbook Name:: nelhage
# Recipe:: default
#
# Copyright 2014, Nelson Elhage
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nelhage::nginx"
include_recipe "nelhage::users"
include_recipe "nelhage::packages"
