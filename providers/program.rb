action :create do
	@run_context.include_recipe 'raven-supervisor'

	name = new_resource.name

	if new_resource.user then
		user new_resource.user do
			system true
			shell "/bin/false"
			action :create
		end
	end

	if new_resource.create_dir then
		directory new_resource.directory do
			user new_resource.user || "nobody"
		end
	end

	template "/etc/supervisor.d/#{name}.conf" do
		cookbook new_resource.cookbook || "raven-supervisor"
		source "supervisor_program.conf.erb"
		variables({
            :name => name,
            :command => new_resource.command,
            :directory => new_resource.directory,
            :user => new_resource.user,
            :numprocs => new_resource.numprocs,
			:exitcodes => new_resource.exitcodes,
			:autostart => new_resource.autostart,
			:autorestart => new_resource.autorestart
			})
		notifies :restart, "service[supervisord]", :delayed
	end
end

action :start do
	raise "not implemented"
end

action :stop do
	raise "not implemented"
end

action :delete do
	raise "not implemented"
end
