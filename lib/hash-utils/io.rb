# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# IO extension.
#

class IO

    ##
    # Indicates, object is IO, so +IO+ or +StringIO+ class.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.14.0
    #
    
    def io?
        true
    end
    
end
