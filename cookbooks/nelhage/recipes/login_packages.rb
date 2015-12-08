%w[emacs24-nox build-essential scons python-software-properties
   python-virtualenv python-pip python-dev htop
   tree gdb mosh].each do |p|
  package p do
    action :upgrade
  end
end
