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

apt_repository 'mosh' do
  uri 'http://ppa.launchpad.net/keithw/mosh/ubuntu'
  distribution node['lsb']['codename']
  components ['main']
  keyserver "keyserver.ubuntu.com"
  key "F2923D3F37FEF230BDDC376E3EB9326A7BF6DFCD"
  action :add
  notifies :run, "execute[apt-get update]", :immediately
end


ZEPHYR_DEPS = %w[libzephyr4-krb5 libzephyr-dev comerr-dev krb5-user zephyr-clients]
BUILD_DEPS = %w[build-essential texinfo pkg-config libperl-dev
   libssl-dev autoconf libncursesw5-dev libglib2.0-dev zip
   python-virtualenv liblocal-lib-perl python-dev
   libxml2-dev libxslt-dev]
MISC_PACKAGES = %w[emacs24-nox ncdu stow tree mutt irssi
                   mosh finger]

(ZEPHYR_DEPS + BUILD_DEPS + MISC_PACKAGES).each do |pkg|
  package pkg do
    action :upgrade
  end
end
