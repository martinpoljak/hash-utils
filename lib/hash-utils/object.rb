# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# Object extension.
#

class Object

    ##
    # Indicates object is in some object which supports +#include?+.
    #
    # @param [Object] range container for analyzing
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.8.0
    #
    
    def in?(range)
        range.include? self
    end

    ##
    # Converts object to Boolean according to Ruby conversion rules.
    #
    # @return [Boolean] +true+ or +false+
    # @since 0.7.0
    #
    
    def to_b
        !!self
    end
    
    ##
    # Multiplies object by +#dup+ n-times.
    #
    # @param [Integer] count required number of copies
    # @return [Array] array with object copies
    # @since 0.12.0
    #
    
    def **(count)
        result = [ ]
        count.times { result << self.dup }
        return result
    end
    
end
