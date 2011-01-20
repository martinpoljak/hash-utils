# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# String extension.
#

class String
    ##
    # Holds numeric matcher.
    #
    
    NUMERIC = /^\s*-?\d+(?:\.\d+)?\s*$/
    
    ##
    # Indicates string is in some object which supports #include?.
    #
    # @param [Object] range container for analyzing
    # @param [Boolean] 'true' if yes, 'false' in otherwise
    # @since 0.3.0
    #
    
    def in?(range)
        range.include? self
    end
    
    ##
    # Indicates, string is numeric, so consists of numbers only.
    #
    # @return [Boolean] 'true' if yes, 'false' in otherwise
    # @since 0.3.0
    #
    
    def numeric?
        if self.match(self.class::NUMERIC)
            true
        else
            false
        end
    end
end
