require 'spec_helper'

describe package('php') do
  it { should be_installed }
end

describe package('php-fpm') do
  it { should be_installed }
end

describe service('php-fpm') do
  it { should be_enabled   }
  it { should be_running   }
end
