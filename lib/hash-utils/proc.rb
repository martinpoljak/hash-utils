# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# Proc extension.
# @since 0.18.0
#

class Proc

    ##
    # Indicates, object is kind of Proc.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.18.0
    #
    
    if not self.__hash_utils_instance_respond_to? :proc?
        def proc?
            true
        end
    end
    
end
