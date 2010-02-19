require 'pp'
#
# Cookbook Name:: starling
# Recipe:: default
#
first = true
app_name1 = ""
node[:applications].each do |app_name,data|
  app_name1 = app_name if first
  first = false  
end
if ['solo', 'app', 'app_master'].include?(node[:instance_role])
   execute "make_it_exec" do
     command "chmod +x /data/#{app_name1}/current/script/workling_client"
   end
   execute "start-starling" do
     command "cd /data/#{app_name1}/current"
     command "RAILS_ENV=production /data/#{app_name1}/current/script/workling_client start"
     not_if "pgrep workling"
   end
end

