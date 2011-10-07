# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "hash-utils/object"

##
# Numeric extension.
# @since 0.16.0
#

class Numeric

    ##
    # Compares numbers. Returns 1 if this is higher, 0 if they are the 
    # same and -1 if it's lower.
    #
    # @param [Numeric] number number for comparsion
    # @return [Integer] comparsion result, see above
    # @since 0.16.0
    #
    
    def compare(number)
        self <=> number
    end
    
    ##
    # Indicates, number is positive, so higher than 0.
    #
    # @return [Boolean] +true+ it it is
    # @since 0.16.0
    #
    
    def positive?
        self > 0
    end
    
    alias :positive :"positive?"
    
    ##
    # Indicates, number is negative, so lower than 0.
    #
    # @return [Boolean] +true+ it it is
    # @since 0.16.0
    #
    
    def negative?
        self < 0
    end
    
    alias :negative :"negative?"
    
    ##
    # Sets the positivity to +false+, so negates the number. +0+ will 
    # be kept.
    #
    # @example
    #   1.negative!   # will return -1
    #
    # @return [Numeric] negative number
    # @since 0.16.0
    #
    
    def negative!
        -self.positive!
    end
    
    alias :"negate!" :"negative!"
    
    ##
    # Sets the positivity to +true+, so makes number positive. +0+ will 
    # be kept.
    #
    # @example
    #   -1.positive!   # will return 1
    #
    # @return [Numeric] positive number
    # @since 0.16.0
    #
    
    alias :"positive!" :abs    
    
    ##
    # Indicates, object is +Numeric+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    def number?
        true
    end

    
end
