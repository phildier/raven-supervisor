
package "python-setuptools"
easy_install_package "supervisor"

directory "/etc/supervisor"

# daemon/client config
template "/etc/supervisor/supervisord.conf" do
	source "supervisord.conf.erb"
	variables ({
			:port => node[:raven_supervisor][:port],
			:username => node[:raven_supervisor][:username],
			:password => node[:raven_supervisor][:password]
			})
end

cookbook_file "/etc/init.d/supervisord" do
	case node["platform"]
	when "ubuntu"
		source "ubuntu-init"
	when "redhat","centos"
		source "redhat-init-equeffelec"
	end
	mode 0755
end

# start it up
service "supervisord" do
	action [:start,:enable]
end
