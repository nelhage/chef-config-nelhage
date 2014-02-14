# Attributes:: default
# Cookbook Name:: tarsnap
#
# Copyright 2011,2012, ZephirWorks
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['tarsnap']['version']     = "1.0.33"
default['tarsnap']['checksum']    = "0c0d825a8c9695fc8d44c5d8c3cd17299c248377c9c7b91fdb49d73e54ae0b7d"
default['tarsnap']['cachedir']    = "/usr/local/tarsnap-cache"

case node['platform']
when 'freebsd'
  default['tarsnap']['packages']          = []
  default['tarsnap']['install_method']    = "ports"
  default['tarsnap']['bin_dir']           = "/usr/local/bin"
  default['tarsnap']['conf_dir']          = "/usr/local/etc"
  default['tarsnap']['private_key']       = "/usr/local/etc/tarsnap.key"
when 'ubuntu'
  default['tarsnap']['packages']          = ['e2fslibs-dev']
  default['tarsnap']['install_method']    = "sources"
  default['tarsnap']['bin_dir']           = "/usr/local/bin"
  default['tarsnap']['conf_dir']          = "/etc"
  default['tarsnap']['private_key']       = "/etc/tarsnap.key"
when 'debian'
  default['tarsnap']['packages']          = ['e2fslibs-dev', 'zlib1g-dev', 'libssl-dev']
  default['tarsnap']['install_method']    = "sources"
  default['tarsnap']['bin_dir']           = "/usr/local/bin"
  default['tarsnap']['conf_dir']          = "/etc"
  default['tarsnap']['private_key']       = "/etc/tarsnap.key"
when 'centos'
  default['tarsnap']['packages']          = ['e2fsprogs-devel']
  default['tarsnap']['install_method']    = "sources"
  default['tarsnap']['bin_dir']           = "/usr/local/bin"
  default['tarsnap']['conf_dir']          = "/etc"
  default['tarsnap']['private_key']       = "/etc/tarsnap.key"
else
  default['tarsnap']['packages']          = []
  default['tarsnap']['install_method']    = "sources"
  default['tarsnap']['bin_dir']           = "/usr/local/bin"
  default['tarsnap']['conf_dir']          = "/etc"
  default['tarsnap']['private_key']       = "/etc/tarsnap.key"
end
