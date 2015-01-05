require 'spec_helper'

describe package('java-1.7.0-openjdk-1.7.0.*.x86_64') do
  it { should be_installed }
end

describe package('jenkins-1.*.noarch') do
  it { should be_installed }
end

describe service('jenkins') do
  it { should be_enabled   }
  it { should be_running   }
end
