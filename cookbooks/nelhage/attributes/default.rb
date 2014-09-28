default['nginx']['default_site_enabled'] = false
default['daemontools']['install_method'] = 'package'
default['nodejs']['install_method'] = 'package'

default['postfix']['main']['smtp_tls_CAfile'] = '/etc/ssl/certs/ca-certificates.crt'

default['nelhage']['users']['extra_groups'] = %w[sudo]

default['livegrep']['linux']['version'] = 'v3.16'
default['livegrep']['linux']['port'] = '9999'
