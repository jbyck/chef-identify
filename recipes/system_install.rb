#
# Cookbook Name:: chef-identify
# Recipe:: system_install
#
# Copyright 2013, Jason Byck
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'identify'

colors      = get_all_colors
user_color  = get_user_color
user_prompt = use_node_name? ? get_prompt_with_node_name : "$PS1"

Chef::Log.debug "Identifying with prompt #{user_prompt}"
Chef::Log.debug "Identifying with user color #{user_color.to_s}"

directory "/etc/profile.d" do
  owner   "root"
  mode    "0755"
end

template "/etc/profile.d/#{node[:identify][:file]}" do
  owner 'root'
  mode '0755'
  source 'identify.sh.erb'
  variables({:colors => colors, :user_color => user_color, :user_prompt => user_prompt})
end


