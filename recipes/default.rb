#
# Cookbook Name:: chef-identify
# Recipe:: default
#
# Copyright 2013, Jason Byck
#
# All rights reserved - Do Not Redistribute
#
class Chef::Recipe
  include Identify
end

prompt = generate_prompt

directory "/etc/profile.d" do
  owner   "root"
  mode    "0755"
end

template "/etc/profile.d/#{node[:identify][:file]}" do
  owner 'root'
  mode '0755'
  source 'identify.sh.erb'
  variables({:prompt => prompt})
end


