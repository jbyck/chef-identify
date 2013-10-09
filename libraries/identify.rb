# Helper functions for chef-identify cookbook

module Identify
            
    CLOSE_COLOR = '\e[0m\]'

    COLORS = {
      :light_purple => '\e[1;35m\]',
      :purple => '\e[0;35m\]',
      :brown => '\e[1;31m\]',
      :white => '\e[1;37m\]',
      :red => '\e[0;31m\]',
      :blue => '\e[0;34m\]',
      :yellow => '\e[0;33m\]',
      :black => '\e[0;30m\]'
    }
    #    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[
    def generate_prompt
      "export PS1=\"#{code_for_color(node[:identify][:color])}\\u@\\h#{close_color}:~ \""
    end
    
    def close_color
      CLOSE_COLOR
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
    def colors
      COLORS
    end

    # Get the bash code for the given color
    #
    # color - The name of the color
    #
    # Returns string
    def code_for_color(color)
      color_name = color.to_sym
      unless supported_colors.include?(color_name)
        Chef::Log::Warn "Unsupported color #{color_name}.  Using #{supported_colors.first}."
        color_name = supported_colors.first
      end
      colors[color_name]  
    end
  
end