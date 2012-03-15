# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "hash-utils/object"

##
# +TrueClass+ extension.
# @since 0.17.0
#

class TrueClass
    
    ##
    # Indicates, object is boolean.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    if not self.__hash_utils_instance_respond_to? :boolean?
        def boolean?
            true
        end
    end
    
    ##
    # Indicates, object is pure +false+, so +FalseClass+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :false?
        def false?
            false
        end
    end
    
    ##
    # Indicates, object is pure +true+, so +TrueClass+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :true?
        def true?
            true
        end
    end
    
    ##
    # Converts value to another type.
    #
    # @param [Object] t  true value equivalent
    # @param [Object] f  false value equivalent
    # @return [Object]  appropriate response
    # @since 0.19.0
    #
    
    if not self.__hash_utils_instance_respond_to? :convert
        def convert(t, f)
            t
        end
    end
    
    ##
    # Converts value to integer.
    #
    # @param [Object] t  true value equivalent
    # @param [Object] f  false value equivalent
    # @return [Object]  appropriate equivalent
    # @since 0.19.0
    #
    
    if not self.__hash_utils_instance_respond_to? :to_i
        def to_i(t = 1, f = 0) 
            self.convert(t, f)
        end
    end
    
end

##
# +FalseClass+ extension.
# @since 0.17.0
#

class FalseClass
    
    ##
    # Indicates, object is boolean.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    if not self.__hash_utils_instance_respond_to? :boolean?
        def boolean?
            true
        end
    end
    
    ##
    # Indicates, object is pure +false+, so +FalseClass+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :false?
        def false?
            true
        end
    end
    
    ##
    # Indicates, object is pure +true+, so +TrueClass+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :true?
        def true?
            false
        end
    end
    
    ##
    # Converts value to another type.
    #
    # @param [Object] t  true value equivalent
    # @param [Object] f  false value equivalent
    # @return [Object]  appropriate equivalent
    # @since 0.19.0
    #
    
    if not self.__hash_utils_instance_respond_to? :convert
        def convert(t, f)
            f
        end
    end
    
    ##
    # Converts value to integer.
    #
    # @param [Object] t  true value equivalent
    # @param [Object] f  false value equivalent
    # @return [Object]  appropriate equivalent
    # @since 0.19.0
    #
    
    if not self.__hash_utils_instance_respond_to? :to_i
        def to_i(t = 1, f = 0) 
            self.convert(t, f)
        end
    end
    
end
