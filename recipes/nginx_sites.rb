node[:app][:sites].each do |app|
    nginx_site "#{app.name}.conf"
end