#
# Cookbook Name:: chef-identify
# Recipe:: system_install
#
# Copyright 2013, Jason Byck
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'identify'

colors = get_all_colors

user_color = node[:identify][:color].to_sym
unless supported_colors.include?(user_color)
  Chef::Log.warn "Unknown color #{user_color}. Using #{default_color}."
  user_color = default_color
end

Chef::Log.debug "Identifying with user color #{user_color.to_s}"

directory "/etc/profile.d" do
  owner   "root"
  mode    "0755"
end

template "/etc/profile.d/#{node[:identify][:file]}" do
  owner 'root'
  mode '0755'
  source 'identify.sh.erb'
  variables({:colors => colors, :user_color => user_color})
end


