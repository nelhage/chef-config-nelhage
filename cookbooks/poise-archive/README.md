# Poise-Archive Cookbook

[![Build Status](https://img.shields.io/travis/poise/poise-archive.svg)](https://travis-ci.org/poise/poise-archive)
[![Gem Version](https://img.shields.io/gem/v/poise-archive.svg)](https://rubygems.org/gems/poise-archive)
[![Cookbook Version](https://img.shields.io/cookbook/v/poise-archive.svg)](https://supermarket.chef.io/cookbooks/poise-archive)
[![Coverage](https://img.shields.io/codecov/c/github/poise/poise-archive.svg)](https://codecov.io/github/poise/poise-archive)
[![Gemnasium](https://img.shields.io/gemnasium/poise/poise-archive.svg)](https://gemnasium.com/poise/poise-archive)
[![License](https://img.shields.io/badge/license-Apache_2-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

A [Chef](https://www.chef.io/) cookbook to unpack file archives like TAR and ZIP files.

**NOTE:** ZIP files are not supported yet, stay tuned.

## Quick Start

To download an unpack and archive:

```ruby
poise_archive 'myapp.tgz' do
  action :nothing
  destination '/opt/myapp'
end

remote_file "#{Chef::Config[:file_cache_path]}/myapp.tgz" do
  source 'https://example.com/myapp.tgz'
  notifies :unpack, 'poise_archive[myapp.tgz]', :immediately
end
```

## Resources

### `poise_archive`

The `poise_archive` resource unpacks file archives.

```ruby
poise_archive '/tmp/myapp-1.2.0.tar' do
  destination '/srv/myapp-1.2.0'
end
```

#### Actions

* `:unpack` – Unpack the archive. *(default)*

#### Properties

* `path` – Path to the archive. If relative, it is taken as a file inside
  `Chef::Config[:file_cache_path]`. *(name attribute)*
* `destination` – Path to unpack the archive to. If not specified, the path of
  the archive without the file extension is used. *(default: auto)*
* `group` – Group to run the unpack as.
* `keep_existing` – Keep existing files in the destination directory when
  unpacking. *(default: false)*
* `strip_components` – Number of intermediary directories to skip when
  unpacking. Works like GNU tar's `--strip-components`. *(default: 1)*
* `user` – User to run the unpack as.

## Sponsors

Development sponsored by [Bloomberg](http://www.bloomberg.com/company/technology/).

The Poise test server infrastructure is sponsored by [Rackspace](https://rackspace.com/).

## License

Copyright 2016, Noah Kantrowitz

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

BZip2 implementation is based on RBzip2. Copyright Sebastian Staudt, Brian Lopez.
RBzip2 code used under the terms of the new BSD license.
