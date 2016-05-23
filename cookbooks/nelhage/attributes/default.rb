default['nginx']['default_site_enabled'] = false
default['nodejs']['install_method'] = 'package'

default['postfix']['main']['smtp_tls_CAfile'] = '/etc/ssl/certs/ca-certificates.crt'

default['nelhage']['users']['extra_groups'] = %w[sudo]

default['go']['version'] = '1.6.2'

default['nelhage']['ruby']['version'] = '2.1.5'

default['tak'] = {}
