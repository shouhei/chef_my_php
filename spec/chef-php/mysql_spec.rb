require 'spec_helper'

describe package('MySQL-server-5.6.21-1.el6.x86_64') do
  it { should be_installed }
end

describe service('mysql') do
  it { should be_enabled   }
  it { should be_running   }
end
