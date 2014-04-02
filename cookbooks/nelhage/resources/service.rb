#
# Cookbook Name:: nelhage
# Resource:: service

actions :start, :stop, :status, :restart, :up, :down, :once, :pause, :cont, :hup, :alrm, :int, :term, :kill, :enable, :disable
default_action [ :enable, :start ]

attribute :service_name, :name_attribute => true
# attribute :directory, :kind_of => String, :required => true
# attribute :template, :kind_of => [String, FalseClass], :default => :service_name
# attribute :cookbook, :kind_of => String
attribute :enabled, :default => false
attribute :running, :default => false
# attribute :variables, :kind_of => Hash, :default => {}
attribute :user, :regex => Chef::Config['user_valid_regex']
attribute :command, :kind_of => String, :required => true
attribute :owner, :regex => Chef::Config['user_valid_regex']
attribute :group, :regex => Chef::Config['group_valid_regex']
attribute :finish, :kind_of => [TrueClass, FalseClass]
attribute :log, :kind_of => [TrueClass, FalseClass]
