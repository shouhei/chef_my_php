#
# Cookbook Name:: develop
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash 'add_epel' do
  user 'root'
    code <<-EOC
    rpm -ivh http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
    sed -i -e "s/enabled *= *1/enabled=0/g" /etc/yum.repos.d/epel.repo
    yum -y update
  EOC
    creates "/etc/yum.repos.d/epel.repo"
end


%w{zsh tmux vim-enhanced}.each do |pkg|
  package pkg do
    action :install
    if pkg == "tmux"
      options "--enablerepo=epel"
    end
  end
end

git "/root/.oh-my-zsh" do
  repository "git://github.com/robbyrussell/oh-my-zsh.git"
  action :checkout
  user "root"
  group "root"
end

template ".zshrc" do
  path "/root/.zshrc"
  owner "root"
  group "root"
  mode 0700
end

bash 'chsh' do
  user 'root'
    code <<-EOC
    chsh root -s /bin/zsh
  EOC
end
