#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'add_rpmforge' do
  user 'root'
    code <<-EOC
    rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
    sed -i -e "s/enabled *= *1/enabled=0/g" /etc/yum.repos.d/rpmforge.repo
  EOC
    creates "/etc/yum.repos.d/rpmforge.repo"
end

bash 'add_remi' do
  user 'root'
    code <<-EOC
    rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
    rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
    sed -i -e "s/enabled *= *1/enabled=0/g" /etc/yum.repos.d/remi.repo
    yum -y update
  EOC
    creates "/etc/yum.repos.d/remi.repo"
end

package "gd-last" do
  action :install
  options "--enablerepo=remi"
end

%w{php php-mysqlnd.x86_64 php-common.x86_64 php-gd.x86_64 php-mbstring.x86_64 php-xml.x86_64 php-devel.x86_64 php-fpm.x86_64}.each do |pkg|
  package pkg do
    action :install
    options "--enablerepo=remi-php56"
  end
end