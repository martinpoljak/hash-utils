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
    
    ##
    # Works by the same way as +String#slice on +Symbol+.
    #
    # @return [String]
    # @see http://www.ruby-doc.org/core/classes/String.html#M001128
    # @since 0.12.0
    # 
    
    def [](*args)
        self.to_s[*args]
    end
    
    alias :slice :[]
    
    ##
    # Returns true if +Symbol+ starts with a prefix given.
    #
    # @param [String+] prefix prefixes for check
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.12.0
    #
    
    def start_with?(*prefix)
        self.to_s.start_with?(*prefix)
    end
    
    ##
    # Returns true if +Symbol+ ends with a prefix given.
    #
    # @param [String+] prefix prefixes for check
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.12.0
    #
    
    def end_with?(*suffix)
        self.to_s.end_with?(*suffix)
    end
        
end
