require 'pp'
#
# Cookbook Name:: starling
# Recipe:: default
#

if ['solo', 'app', 'app_master'].include?(node[:instance_role])
   execute "start-starling" do
     command "cd /data/#{app_name}/current"
     command "RAILS_ENV=production ./script/workling_client start"
     not_if "pgrep workling"
   end
end

