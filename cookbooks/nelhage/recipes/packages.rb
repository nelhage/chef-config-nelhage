#
# Cookbook Name:: nelhage
# Recipe:: packages
#
# Copyright 2014, Nelson Elhage
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nelhage::login_packages"

if node['lsb']['release'] < '14.04'
  apt_repository 'mosh' do
    uri 'http://ppa.launchpad.net/keithw/mosh/ubuntu'
    distribution node['lsb']['codename']
    components ['main']
    keyserver "keyserver.ubuntu.com"
    key "F2923D3F37FEF230BDDC376E3EB9326A7BF6DFCD"
    action :add
    notifies :run, "execute[apt-get update]", :immediately
  end
end


ZEPHYR_DEPS = %w[libzephyr4-krb5 libzephyr-dev comerr-dev krb5-user zephyr-clients]
BUILD_DEPS = %w[build-essential texinfo pkg-config libperl-dev
   libssl-dev autoconf libncursesw5-dev libglib2.0-dev zip
   liblocal-lib-perl libxml2-dev libxslt-dev cython
   libsqlite3-dev]
MISC_PACKAGES = %w[ncdu stow mutt irssi
                   mosh finger ntp]

(ZEPHYR_DEPS + BUILD_DEPS + MISC_PACKAGES).each do |pkg|
  package pkg do
    action :upgrade
  end
end
