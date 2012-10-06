# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "hash-utils/object"

##
# StringIO extension.
#

if Ruby::Engine != :rbx
    class StringIO < Data

        ##
        # Indicates, object is IO, so +IO+ or +StringIO+ class.
        #
        # @return [Boolean] +true+ if yes, +false+ in otherwise
        # @since 0.14.0
        #
        
        if not self.__hash_utils_instance_respond_to? :io?
            def io?
                true
            end
        end
        
    end
else
    class StringIO < Object

        ##
        # Indicates, object is IO, so +IO+ or +StringIO+ class.
        #
        # @return [Boolean] +true+ if yes, +false+ in otherwise
        # @since 0.14.0
        #
        
        if not self.__hash_utils_instance_respond_to? :io?
            def io?
                true
            end
        end
        
    end
end
