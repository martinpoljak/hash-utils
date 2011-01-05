# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

class Numeric
    ##
    # Indicates numeric is in some object which supports #include?.
    #
    
    def in?(range)
        range.include? self
    end
end
