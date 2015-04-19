node[:app][:inits].each do |app|
    template "/etc/init/#{app['name']}.conf" do
      owner "root"
      group "root"
      mode '0644'
      source "upstart_init.conf.erb"
      action :create
      variables app
    end

    service "#{app['name']}" do
      provider Chef::Provider::Service::Upstart
      action :start
    end
end
