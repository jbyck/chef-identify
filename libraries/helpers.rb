# Transforms a symbol into bash variable. This function should be used when *declaring* bash variables
#
# sym - The symbol to transform
#
# Returns string
def to_bash(sym)
  sym.to_s.upcase.strip
end

# Transform symbol into a usable bash variable. This function should be used when *using* bash variables.
#
# sym - The symbol to transform
#
# Retuns string
def to_bash_variable(sym)
  "$#{to_bash(sym)}"
end
