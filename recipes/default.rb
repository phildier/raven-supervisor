
package "python-setuptools"
easy_install_package "supervisor"

directory "/etc/supervisor.d"
directory "/var/log/supervisor"

# daemon/client config
config_path = "/etc/supervisord.conf"
template config_path do
	source "supervisord.conf.erb"
	variables ({
			:port => node[:raven_supervisor][:port],
			:username => node[:raven_supervisor][:username],
			:password => node[:raven_supervisor][:password]
			})

	notifies :restart, "service[supervisord]", :delayed
end

cookbook_file "/etc/init.d/supervisord" do
	case node["platform"]
	when "ubuntu"
		source "ubuntu-init"
	when "redhat","centos","fedora","amazon"
		source "redhat-init-equeffelec"
	end
	mode 0755

	notifies :restart, "service[supervisord]", :delayed
end

# start it up
service "supervisord" do
	action [:start,:enable]
end
