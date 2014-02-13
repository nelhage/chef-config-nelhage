#
# Cookbook Name:: nelhage
# Recipe:: packages
#
# Copyright 2014, Nelson Elhage
#
# All rights reserved - Do Not Redistribute
#

apt_repository 'cassou_emacs' do
  uri 'http://ppa.launchpad.net/cassou/emacs/ubuntu'
  distribution node['lsb']['codename']
  components ['main']
  keyserver "keyserver.ubuntu.com"
  key "8FBB7709281B6E626DD855CF84DBCE2DCEC45805"
  action :add
  notifies :run, "execute[apt-get update]", :immediately
end

%w[emacs24-nox ncdu liblocal-lib-perl irssi tree python-virtualenv
   python-dev mutt].each do |pkg|
  package pkg do
    action :upgrade
  end
end

