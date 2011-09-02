# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# +TrueClass+ extension.
# @since 0.17.0
#

class TrueClass
    
    ##
    # Indicates, object is boolean.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    def boolean?
        true
    end
    
    ##
    # Indicates, object is pure +false+, so +FalseClass+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.15.0
    #
    
    def false?
        false
    end
    
    ##
    # Indicates, object is pure +true+, so +TrueClass+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.15.0
    #
    
    def true?
        true
    end
    
    ##
    # Converts value to another type.
    #
    # @param [Object] t  true value equivalent
    # @param [Object] f  false value equivalent
    # @return [Object]  appropriate response
    # @since 0.19.0
    #
    
    def convert(t, f)
        t
    end
    
    ##
    # Converts value to integer.
    #
    # @param [Object] t  true value equivalent
    # @param [Object] f  false value equivalent
    # @return [Object]  appropriate equivalent
    # @since 0.19.0
    #
    
    def to_i(t = 1, f = 0) 
        self.convert(t, f)
    end
    
end

##
# +FalseClass+ extension.
# @since 0.17.0
#

class FalseClass
    
    ##
    # Indicates, object is boolean.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    def boolean?
        true
    end
    
    ##
    # Indicates, object is pure +false+, so +FalseClass+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.15.0
    #
    
    def false?
        true
    end
    
    ##
    # Indicates, object is pure +true+, so +TrueClass+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.15.0
    #
    
    def true?
        false
    end
    
    ##
    # Converts value to another type.
    #
    # @param [Object] t  true value equivalent
    # @param [Object] f  false value equivalent
    # @return [Object]  appropriate equivalent
    # @since 0.19.0
    #
    
    def convert(t, f)
        f
    end
    
    ##
    # Converts value to integer.
    #
    # @param [Object] t  true value equivalent
    # @param [Object] f  false value equivalent
    # @return [Object]  appropriate equivalent
    # @since 0.19.0
    #
    
    def to_i(t = 1, f = 0) 
        self.convert(t, f)
    end
    
end
