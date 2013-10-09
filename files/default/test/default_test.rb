require 'minitest/spec'
require 'chef/mixin/shell_out'

describe 'identify::default' do
  
  include Chef::Mixin::ShellOut
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources
  
  it 'should create the identify file' do
    file(File.join('etc', 'profile.d', node[:identify][:file])).must_exist
  end
  
  describe 'identify.sh' do
    
    it 'should include the color name as bash variable' do
      file(File.join('etc', 'profile.d', node[:identify][:file])).must_include "#{to_bash_variable(node[:identify][:color])}"
    end
    
  end
  
end