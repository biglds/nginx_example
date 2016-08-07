#
# Cookbook Name:: nginx_proxy
# Recipe:: install
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


include_recipe 'nginx'

nginx_site 'default' do
  enable node['nginx']['default_site_enabled']
end