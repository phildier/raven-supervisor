actions [:create, :start, :stop, :delete]
default_action :create

attribute :name, :kind_of => String, :name_attribute => true
attribute :user, :kind_of => String, :default => "nobody"
attribute :directory, :kind_of => String
attribute :environment, :kind_of => Hash, :default => {}
attribute :command, :kind_of => String
attribute :numprocs, :kind_of => Integer, :default => 1
attribute :cookbook, :kind_of => String
attribute :exitcodes, :kind_of => Array, :default => [0,2]
attribute :autostart, :kind_of => String, :default => "true"
attribute :autorestart, :kind_of => String, :default => "true"
attribute :create_dir, :kind_of => [TrueClass,FalseClass], :default => true
