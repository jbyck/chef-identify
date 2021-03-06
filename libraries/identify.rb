# Helper functions for chef-identify cookbook

class Chef
  module Identify
    
      # Default color to use if no (or invalid color) is specified
      DEFAULT_COLOR = :white

      # Character used to start color code
      COLOR_START = '\[\033['
      
      # Character used to end color code
      COLOR_END   = '\]'

      # List of supported colors
      COLORS = {
        :white => '1;37m',
        :purple => '0;35m',
        :light_purple => '1;35m',
        :brown => '1;31m',
        :red => '0;31m',
        :light_red => '1;31m',
        :blue => '0;34m',
        :light_blue => '1;34m',
        :yellow => '0;33m',
        :black => '0;30m',
        :cyan => '0;36m',
        :light_cyan => '1;36m'
      }

      # Identify user in prompt
      PROMPT_USER = '\u'
      # Identify host in prompt
      PROMPT_HOST = '\h'
      # Identify path in prompt
      PROMPT_PATH = '\w'     

      # Default color for library
      #
      # Returnst symbol
      def default_color
        DEFAULT_COLOR
      end

      # Return the list of colors supported by the cookboook
      #
      # Returns array
      def supported_colors
        COLORS.keys
      end
      
      # Return the code for the given color
      #
      # color - Name of the color
      # 
      # Returns string
      def code_for_color(color)
        "#{COLOR_START}#{COLORS[color.to_sym]}#{COLOR_END}"
      end
  
      # Supported color and bash code
      #
      #
      # Returns hash
      def get_all_colors
        colors = {}
        supported_colors.map { |c| colors[c] = code_for_color(c) }
        colors
      end
      
      # Is the node configured and able to use the node name in the prompt
      #
      # Returns boolean
      def use_node_name?
        Chef::Log.debug "USE NODE: #{node[:identify][:use_node_name]}"
        Chef::Log.debug [true, 'true', 't', 'yes'].include?(node[:identify][:use_node_name])
        [true, 'true', 't', 'yes'].include?(node[:identify][:use_node_name])
      end
      
      # Generate a string to use as the PS1 prompt, using the node name
      #
      # Returns string
      def get_prompt_with_node_name
        "#{PROMPT_USER}@#{node.name}:#{PROMPT_PATH}\\$ "
      end
      
      # Retrieve the name of the user specified color. Use the node value of node[:identify][:color].
      # If that color is not in the supported_colors array, then use default color
      #
      # Returns symbol
      def get_user_color
        user_color = node[:identify][:color].to_sym
        unless supported_colors.include?(user_color)
          Chef::Log.warn "Unknown color #{user_color}. Using #{default_color}."
          user_color = default_color
        end
        user_color
      end
      
      
  end
end
