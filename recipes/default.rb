#
# Cookbook Name:: bind
# Recipe:: default
#
# Default recipe for bind should
# Setup packages
# Setup configs
# Start services
# 

package node['bind']['package'] do
  action :install
end

service node['bind']['service'] do
  action [:enable, :start]
  supports :status => true, :restart => true, :reload => true
end

template node['bind']['config'] do
  source "named.conf.erb"
  owner node['bind']['user']
  group node['bind']['group']
  mode  0644

  notifies :restart, "service[#{node['bind']['service']}]"
end
