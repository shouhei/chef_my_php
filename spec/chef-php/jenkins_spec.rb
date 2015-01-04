require 'spec_helper'

describe package('java-1.7.0-openjdk-1.7.0.71-2.5.3.2.el6_6.x86_64') do
  it { should be_installed }
end

describe package('jenkins-1.595-1.1.noarch') do
  it { should be_installed }
end

describe service('jenkins') do
  it { should be_enabled   }
  it { should be_running   }
end
