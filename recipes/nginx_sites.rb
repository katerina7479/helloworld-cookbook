node[:app][:sites].each do |app|
    nginx_site "#{app.name}.conf" do
        template "default-site.erb"
    end
end