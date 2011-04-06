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
    
    ##
    # Puts content to end of symbol and returns new symbol.
    #
    # @param [String] string string for append
    # @return [Symbol] itself
    # @since 0.13.0
    #
    
    def append(string)
        (self.to_s << string.to_s).to_sym
    end    
    
    ##
    # Puts content to begin of symbol and returns new symbol.
    #
    # @param [String] string string for prepend
    # @return [Symbol] itself
    # @since 0.13.0
    #
    
    def prepend(string)
        (string.to_s + self.to_s).to_sym
    end    
    
    ##
    # Splits symbol to more.
    #
    # @param [String] separator separator for splitting
    # @param [Integer] count max new parts count
    # @since 0.15.0
    # 
    
    def split(separator = " ", count = 0)
        self.to_s.split(separator, count).map! do |i|
            i.to_sym
        end
    end
        
end
