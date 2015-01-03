require 'spec_helper'

describe service('/root/.oh-my-zsh') do
  it { should be_be_directory }
end
