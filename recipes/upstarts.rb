
template "/etc/init/helloworld.conf" do
  owner "root"
  group "root"
  mode 644
  source "upstart_init.conf.erb"
  action :create
  variables node[:app][:inits][:helloworld]
end

service "helloworld" do
  action :start
end
