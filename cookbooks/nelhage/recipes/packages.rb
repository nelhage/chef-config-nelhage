#
# Cookbook Name:: nelhage
# Recipe:: packages
#
# Copyright 2014, Nelson Elhage
#
# All rights reserved - Do Not Redistribute
#

%w[emacs24-nox].each do |pkg|
  package pkg do
    action :upgrade
  end
end

