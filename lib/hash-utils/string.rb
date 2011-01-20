# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

class String
    ##
    # Holds numeric matcher.
    #
    
    NUMERIC = /^\s*-?\d+(?:\.\d+)?\s*$/
    
    ##
    # Indicates string is in some object which supports #include?.
    # @since 0.3.0
    #
    
    def in?(range)
        range.include? self
    end
    
    ##
    # Indicates, string is numeric, so consists of numbers only.
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
