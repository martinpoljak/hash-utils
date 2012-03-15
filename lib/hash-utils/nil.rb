# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "hash-utils/object"

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
    
    if not self.__hash_utils_instance_respond_to? :to_boolean
        def to_boolean(*args)
            false
        end
    end
    
end
