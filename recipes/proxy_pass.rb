#
# Cookbook Name:: nginx_proxy
# Recipe:: proxy_pass
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#



node.set['nginx']['default_site_enabled'] = false

include_recipe 'nginx'


# Ensure conf.d directory exists
directory "#{node['nginx']['dir']}/conf.d" do
  owner 'root'
  group 'root'
  recursive true
end


# Code to ensure nginx restarts
ruby_block 'killall_nginx' do
  block do

    out = %x(killall nginx)
    unless $?.to_i == 0
      require 'colorize'
      Chef::Log.error out.red
    end
    Chef::Log.info %x(2>&1 ps auxwww | grep [n]ginx)

  end
  action :nothing
end

# Place proxy config file in proper directory
template "#{node['nginx']['dir']}/conf.d/bing.conf" do
  source    'bing.conf.erb'
  mode      0644
  notifies  :restart, 'service[nginx]', :delayed
  notifies  :run, 'ruby_block[killall_nginx]', :immediately
  action    :create
end

template "#{node['nginx']['dir']}/conf.d/weather.conf" do
  source    'weather.conf.erb'
  mode      0644
  notifies  :restart, 'service[nginx]', :delayed
  notifies  :run, 'ruby_block[killall_nginx]', :immediately
  action    :create
end