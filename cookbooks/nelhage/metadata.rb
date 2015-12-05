name             'nelhage'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures nelhage'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "golang"
depends "nginx"
depends "daemontools"
depends "tarsnap"
depends "cron"
depends "python"
depends "postfix"
depends "sysctl"
depends "logrotate"
depends "nodejs"
depends "ssh_known_hosts"
depends "poise-python"
