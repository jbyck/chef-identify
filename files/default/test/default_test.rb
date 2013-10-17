require 'minitest/spec'
require 'chef/mixin/shell_out'

describe 'identify::default' do
  
  include Chef::Mixin::ShellOut
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources
  include Chef::Identify
  
  it 'should create the identify file' do
    file(File.join('etc', 'profile.d', node[:identify][:file])).must_exist
  end
  
  describe 'identify.sh' do
    
    let(:identify_file) { File.join('etc', 'profile.d', node[:identify][:file]) }
    
    it 'should include the color name as bash variable' do
      file(identify_file).must_include "#{to_bash_variable(node[:identify][:color])}"
    end
     
    it 'should include the correct prompt value' do
      
      if use_node_name?
        file(identify_file).must_include node.name
      else
        file(identify_file).must_include "$PS1"
      end
      
    end
    
  end
  
end