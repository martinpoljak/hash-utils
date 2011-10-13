# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# NilClass extension.
# @since 0.19.0
#

class NilClass
    
    ##
    # Converts +nil+ to boolean.
    #
    # @return [FalseClass] result
    # @since 0.19.0
    #
    
    def to_boolean(*args)
        false
    end
    
end
