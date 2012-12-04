# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

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
    
    if not self.__hash_utils_instance_respond_to? :*
        def *(multi)
            (self.to_s * multi).to_sym 
        end
    end

    ##
    # Returns a new +Symbol+ containing +other_str+ concatenated 
    # to +str+.
    #
    # @param [Symbol, String] other_str string or symbol for concatenating to
    # @return [Symbol] new symbol
    # @since 0.12.0
    #
    
    if not self.__hash_utils_instance_respond_to? :+
        def +(other_str)
            (self.to_s + other_str.to_s).to_sym
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :concat
        alias :concat :+
    end
    
    ##
    # Works by the same way as +String#slice on +Symbol+.
    #
    # @return [String]
    # @see http://www.ruby-doc.org/core/classes/String.html#M001128
    # @since 0.12.0
    # 
    
    if not self.__hash_utils_instance_respond_to? :[]
        def [](*args)
            self.to_s[*args]
        end
    end
    
    
    if not self.__hash_utils_instance_respond_to? :slice
        alias :slice :[]
    end
    
    ##
    # Returns true if +Symbol+ starts with a prefix given.
    #
    # @param [String+] prefix prefixes for check
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.12.0
    #
    
    if not self.__hash_utils_instance_respond_to? :start_with?
        def start_with?(*prefix)
            self.to_s.start_with?(*prefix)
        end
    end
    
    ##
    # Returns true if +Symbol+ ends with a prefix given.
    #
    # @param [String+] prefix prefixes for check
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.12.0
    #
    
    if not self.__hash_utils_instance_respond_to? :end_with?
        def end_with?(*suffix)
            self.to_s.end_with?(*suffix)
        end
    end
    
    ##
    # Puts content to end of symbol and returns new symbol.
    #
    # @param [String] string string for append
    # @return [Symbol] itself
    # @since 0.13.0
    #
    
    if not self.__hash_utils_instance_respond_to? :append
        def append(string)
            (self.to_s << string.to_s).to_sym
        end
    end
    
    ##
    # Puts content to begin of symbol and returns new symbol.
    #
    # @param [String] string string for prepend
    # @return [Symbol] itself
    # @since 0.13.0
    #
    
    if not self.__hash_utils_instance_respond_to? :prepend
        def prepend(string)
            (string.to_s + self.to_s).to_sym
        end    
    end
    
    ##
    # Splits symbol to more.
    #
    # @param [String] separator separator for splitting
    # @param [Integer] count max new parts count
    # @since 0.15.0
    # 
    
    if not self.__hash_utils_instance_respond_to? :split
        def split(separator = " ", count = 0)
            self.to_s.split(separator, count).map! do |i|
                i.to_sym
            end
        end
    end
    
    ##
    # Strips whitespace from symbol. It seems non-sense, but it's useful
    # if you convert some data with problematic white-space heterogenity
    # to symbols -- for example large CSV files or so.
    #
    # @return [Symbol] new symbol without whitespace
    # @since 0.17.0
    #
    
    if not self.__hash_utils_instance_respond_to? :strip
        def strip
            self.to_s.strip!.to_sym
        end
    end
    
    ##
    # Compares symbols by three-value comparing. Implements the +<=>+
    # operator in fact.
    #
    # @param [Symbol] symbol to compare
    # @return [Integer]
    # @since 2.1.0
    #
    
    if not self.__hash_utils_instance_respond_to? :<=>
        def <=>(symbol)
            self.to_s <=> symbol.to_s
        end
    end
        
end
