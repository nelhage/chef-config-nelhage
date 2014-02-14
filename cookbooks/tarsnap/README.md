Tarsnap cookbook
================

This cookbook installs and configures [tarsnap](https://www.tarsnap.com). Optionally it can also
install and configure [tarsnapper](https://github.com/miracle2k/tarsnapper).

Requirements
============

## Platforms:

* FreeBSD 8.x and 9.x
* Ubuntu 10.04, 11.10 and 12.04
* Debian 6.x
* CentOS 5.8 and 6.3

Warning: at the moment the tarsnapper recipe is somewhat broken on CentOS 5.8.

Tests
=====

This cookbook in the [source repository](https://github.com/andreacampi/tarsnap-cookbook) contains minitest tests.

Attributes
==========

General settings
----------------

* `node['tarsnap']['version']` - The version of tarsnap to install. Defaults to "1.0.32".
* `node['tarsnap']['cachedir']` - Value for cachedir directive. Defaults to "/usr/local/tarsnap-cache".

Platform specific
-----------------

In order to support the broadest number of platforms, several attributes are determined based on the node's platform. See the attributes/default.rb file for default values in the case statement.

* `node['tarsnap']['install_method']` - Can be either `ports` (for FreeBSD) or `source` (for distros that don't have a pre-packaged version of tarsnap).
* `node['tarsnap']['conf_dir']` - The directory where configuration files should be stored.
* `node['tarsnap']['private_key']` - The private key for connecting to tarsnap.

Tarsnapper settings
-------------------

* `node['tarsnapper']['retention']` - How long to retain the backups; see the [documentation](https://github.com/miracle2k/tarsnapper) for tarsnapper.
* `node['tarsnapper']['packages']` - Platform-specific dependencies for tarsnapper.

Recipes
=======

default
-------

The default recipe installs tarsnap by calling the appropriate recipe, then builds a configuration file.

Due to tarsnap's security model, you will need to manually create a key on each node.

freebsd
-------

Installs tarsnap from FreeBSD ports.

sources
-------

Build and installs tarsnap from a source tarball.

tarsnapper
----------

Installs and configures tarsnapper.

License and Authors
===================

Author:: Andrea Campi <andrea.campi@zephirworks.com>

Copyright:: 2011-2012, ZephirWorks

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
