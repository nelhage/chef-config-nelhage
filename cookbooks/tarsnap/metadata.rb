maintainer       "ZephirWorks"
maintainer_email "andrea.campi@zephirworks.com"
license          "Apache 2.0"
description      "Installs/Configures tarsnap"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.2"

recipe "tarsnap", "Installs tarsnap"

%w{build-essential git python}.each do |cb|
  depends cb
end

%w{centos freebsd ubuntu debian}.each do |os|
  supports os
end

attribute "tarsnap",
  :display_name => "tarsnap",
  :description => "Hash of tarsnap attributes",
  :type => "hash"

attribute "tarsnap/cachedir",
  :display_name => "tarsnap cachedir",
  :description => "Path to the tarsnap cache dir",
  :default => "/usr/local/tarsnap-cache"

attribute "tarsnap/conf_dir",
  :display_name => "tarsnap config dir",
  :description => "Path to the tarsnap config dir",
  :default => "/etc"

attribute "tarsnap/private_key",
  :display_name => "tarsnap private key",
  :description => "Path to the tarsnap private key file",
  :default => "/etc/tarsnap.key"

attribute "tarsnap/retention",
  :display_name => "tarsnap retention policy",
  :description => "Retention policy of tarsnap backups",
  :default => "1d 7d 30d 3650d"
