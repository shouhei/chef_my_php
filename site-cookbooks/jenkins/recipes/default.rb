#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "java-1.7.0-openjdk" do
  action :install
end

remote_file "/etc/yum.repos.d/jenkins.repo" do
  source "#{node['jenkins']['repo']}"
end

bash "jenkins-repo" do
  user "root"
  code <<-EOH
    rpm --import "#{node['jenkins']['key']}"
  EOH
end

package "jenkins" do
  action :install
end

service "jenkins" do
    action [:enable, :start]
end
