default['nginx']['default_site_enabled'] = false
default['nodejs']['install_method'] = 'package'

default['postfix']['main']['smtp_tls_CAfile'] = '/etc/ssl/certs/ca-certificates.crt'

default['nelhage']['users']['extra_groups'] = %w[sudo]

default['go']['version'] = '1.7.4'

default['nelhage']['ruby']['version'] = '2.1.5'

default['tak'] = {}
default['tak']['taktician'] = {
  "user" => "TakticianBot",
  "size" => 5,
  "debug" => 2,
  "depth" => 0,
  "limit" => "30s",
  "time" => "20m",
  "increment" => "30s",
}
default['tak']['friendlybot'] = {
  "user" => "FriendlyBot",
  "debug" => 1,
  "size" => 5,
  "limit" => "30s",
  "time" => "15m",
  "increment" => "30s",
  "friendly" => true,
  "log-file" => "/home/nelhage/code/go/src/github.com/nelhage/taktician/games/friendly.log",
}
default['tak']['fpabot'] = {
  "user" => "FPABot",
  "debug" => 1,
  "size" => 5,
  "limit" => "30s",
  "time" => "15m",
  "increment" => "30s",
  "friendly" => true,
  "fpa" => 'center',
  "log-file" => "/home/nelhage/code/go/src/github.com/nelhage/taktician/games/fpa.log",
}
default['tak']['doublestackbot'] = {
  "user" => "DoubleStackBot",
  "debug" => 1,
  "size" => 5,
  "limit" => "30s",
  "time" => "15m",
  "increment" => "30s",
  "friendly" => true,
  "fpa" => 'doublestack',
  "log-file" => "/home/nelhage/code/go/src/github.com/nelhage/taktician/games/doublestack.log",
}
