package "gitolite" do
  action :install
  response_file "gitolite.seed.erb"
end

package "openbsd-inetd" do
  action :upgrade
end

execute "run git daemon" do
  command "update-inetd --group OTHER --add 'git\tstream\ttcp\tnowait\tgit\t/usr/bin/git git daemon --inetd --base-path=/opt/git/repositories/ --syslog --verbose'"
  not_if "grep -q 'git daemon' /etc/inetd.conf"
end
