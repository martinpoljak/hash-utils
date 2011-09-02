# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# NilClass extension.
# @since 0.19.0
#

class NilClass
    
    ##
    # Equivalent of {TrueClass#to_boolean}, but returns always +false+.
    #
    # @param [Object] t  true equivalent
    # @return [FalseClass] result
    # @since 0.19.0
    #
    
    def to_boolean(t = nil)
        false
    end
    
end
