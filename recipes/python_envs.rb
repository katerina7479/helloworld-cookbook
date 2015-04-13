python_virtualenv '/home/vagrant/hello_env' do
  owner 'vagrant'
  group 'vagrant'
  action :create
end

bash 'install app dependancies' do
  code '/home/vagrant/hello_env/bin/pip install -r requirements.txt'
  cwd '/vagrant'
  user 'vagrant'
end

bash 'install app package' do
  code '/home/vagrant/hello_env/bin/python setup.py develop'
  cwd '/vagrant'
  user 'vagrant'
end
