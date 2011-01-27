# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# Numeric extension.
#

class Numeric
    ##
    # Indicates numeric is in some object which supports +#include?+.
    #
    # @param [Object] range container for analyzing
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.3.0
    #
    
    def in?(range)
        range.include? self
    end
end
