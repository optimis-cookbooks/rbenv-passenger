include_recipe 'rbenv'

rbenv_gem 'passenger' do
  rbenv_version node['rbenv']['global']
end

%w(apache2-prefork-dev libapr1-dev libcurl4-gnutls-dev).each do |pkg|
  package pkg do
    action :upgrade
  end
end

rbenv_script 'passenger-install-apache2-module' do
  rbenv_version node['rbenv']['global']
  code 'passenger-install-apache2-module --auto'
  creates node['passenger']['module_path']
end

include_recipe 'apache2'

template "#{node[:apache][:dir]}/mods-available/passenger.conf" do
  source   'passenger.conf.erb'
  owner    'root'
  group    'root'
  mode     0644
  notifies :restart, 'service[apache2]'
end

apache_module 'passenger' do
  module_path node['passenger']['module_path']
  enable true
end
