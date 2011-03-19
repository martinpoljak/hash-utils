# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "hash-utils/object"

##
# Symbol extension.
#

class Symbol

    ##
    # Returns a new +Symbol+ containing integer copies of the receiver.
    #
    # @param [Integer] multi required number of copies
    # @return [Symbol] new symbol
    # @since 0.12.0
    #
    
    def *(multi)
        (self.to_s * multi).to_sym 
    end

    ##
    # Returns a new +Symbol+ containing +other_str+ concatenated 
    # to +str+.
    #
    # @param [Integer] other_str string for concatenating to
    # @return [Symbol] new symbol
    # @since 0.12.0
    #
    
    def +(other_str)
        (self.to_s + other_str.to_s).to_sym
    end
    
    alias :concat :+
    
end
