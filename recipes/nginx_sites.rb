node[:app][:sites].each do |app|
    nginx_site "#{app.name}.conf" do
        template "nginx_site.erb"
        variables app.variables
    end
end