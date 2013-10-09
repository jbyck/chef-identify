# Helper functions for chef-identify cookbook

class Chef
  module Identify
    
      # Default color to use if no (or invalid color) is specified
      DEFAULT_COLOR = :white

      # List of supported colors
      COLORS = {
        :white => '\e[1;37m\]',
        :purple => '\e[0;35m\]',
        :light_purple => '\e[1;35m\]',
        :brown => '\e[1;31m\]',
        :red => '\e[0;31m\]',
        :light_red => '\e[1;31m\]',
        :blue => '\e[0;34m\]',
        :light_blue => '\e[1;34m\]',
        :yellow => '\e[0;33m\]',
        :black => '\e[0;30m\]',
        :cyan => '\e[0;36m\]',
        :light_cyan => '\e[1;36m\]'
      }
      
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
  
      # Supported color and bash code
      #
      #
      # Returns hash
      def get_all_colors
        COLORS
      end
      
      
  end
end
