require 'minitest/spec'

describe 'identify::default' do
  
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources
  
  it 'should create the profile file' do
    file("/etc/profile.d/#{node[:identify][:file]}").must_exist
  end
  
end