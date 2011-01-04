# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

class Numeric
    ##
    # Indicates numeric is in range.
    #
    
    def in?(range)
        if not range.kind_of? Range
            Exception::new("Range expected.")
        end
        
        range.include? self
    end
end
