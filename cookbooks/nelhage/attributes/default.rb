default['nginx']['default_site_enabled'] = false
default['nodejs']['install_method'] = 'package'

default['postfix']['main']['myorigin'] = '$mydomain'
default['postfix']['main']['smtp_tls_CAfile'] = '/etc/ssl/certs/ca-certificates.crt'

default['nelhage']['users']['extra_groups'] = %w[sudo]

default['nelhage']['ruby']['version'] = '2.1.5'

default['tak'] = {}
default['tak']['taktician'] = {
  "user" => "TakticianBot",
  "size" => 6,
  "debug" => 2,
  "depth" => 0,
  "limit" => "30s",
  "time" => "20m",
  "increment" => "30s",
  "multi-cut" => true,
}
default['tak']['friendlybot'] = {
  "user" => "FriendlyBot",
  "debug" => 1,
  "size" => 6,
  "limit" => "30s",
  "time" => "15m",
  "increment" => "30s",
  "friendly" => true,
  "log-file" => "/home/nelhage/go/src/github.com/nelhage/taktician/games/friendly.log",
}
# default['tak']['cairnbot'] = {
#   "user" => "CairnBot",
#   "debug" => 1,
#   "size" => 6,
#   "limit" => "30s",
#   "time" => "15m",
#   "increment" => "30s",
#   "multi-cut" => true,
#   "friendly" => true,
#   "fpa" => 'cairn',
#   "log-file" => "/home/nelhage/go/src/github.com/nelhage/taktician/games/cairn.log",
# }
# default['tak']['fpabot'] = {
#   "user" => "FPABot",
#   "debug" => 1,
#   "size" => 6,
#   "limit" => "30s",
#   "time" => "15m",
#   "increment" => "30s",
#   "multi-cut" => true,
#   "friendly" => true,
#   "fpa" => 'center',
#   "log-file" => "/home/nelhage/go/src/github.com/nelhage/taktician/games/fpa.log",
# }
# default['tak']['doublestackbot'] = {
#   "user" => "DoubleStackBot",
#   "debug" => 1,
#   "size" => 6,
#   "limit" => "30s",
#   "time" => "15m",
#   "multi-cut" => true,
#   "increment" => "30s",
#   "friendly" => true,
#   "fpa" => 'doublestack',
#   "log-file" => "/home/nelhage/go/src/github.com/nelhage/taktician/games/doublestack.log",
# }
