# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# Object extension.
#

class Object
    ##
    # Converts object to Boolean according to Ruby conversion rules.
    #
    # @return [Boolean] +true+ or +false+
    # @since 0.7.0
    #
    
    def to_b
        !!self
    end
end
