apt_repository 'cassou_emacs' do
  uri 'http://ppa.launchpad.net/cassou/emacs/ubuntu'
  distribution node['lsb']['codename']
  components ['main']
  keyserver "keyserver.ubuntu.com"
  key "8FBB7709281B6E626DD855CF84DBCE2DCEC45805"
  action :add
  notifies :run, "execute[apt-get update]", :immediately
end

%w[emacs24-nox build-essential scons python-software-properties
   python-virtualenv python-pip python-dev emacs24-nox
   tree gdb mosh].each do |p|
  package p do
    action :upgrade
  end
end
