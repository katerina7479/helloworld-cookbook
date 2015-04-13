
node[:app][:python_apps].each do |app|
    virtual_env_path = "/home/vagrant/#{app['name']}_env"
    python_virtualenv virtual_env_path do
        owner app.user
        group app.group
        action :create
    end

    bash "install app_#{app['name']}" do
      code "#{virtual_env_path}/bin/pip install -r requirements.txt"
      cwd app.base_dir
      user app.user
    end

    bash "start project_#{app['name']}" do
      code "#{virtual_env_path}/bin/django-admin.py startproject test_project"
      ignore_failure true
      cwd app.base_dir
      user app.user
    end

    bash "setup project_#{app['name']}" do
      code "#{virtual_env_path}/bin/python setup.py develop"
      cwd app.base_dir
      user app.user
    end
end
