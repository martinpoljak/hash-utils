# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "hash-utils/gem"

##
# Array extension.
#

class Array

    @__sum_check_done

    ##
    # Moves selected values outside the array, so returns them.
    #
    # Works similar to +Hash#reject!+, but returns removed items instead 
    # of remaining items.
    #
    # @param [Proc] block selecting block
    # @return [Array] removed values
    # @since 0.3.0
    #
    
    def remove!(&block)
        result = [ ]
        self.reject! do |v|
            if block.call(v)
                result << v
                true
            else
                false
            end
        end
        
        return result
    end
    
    ##
    # Checks, at least one value follows condition expressed in 
    # block. Block must return Boolean.
    #
    # @param [Proc] block checking block
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.2.0
    #
    
    alias :"some?" :"one?"
    
    ##
    # Converts array to +Hash+.
    #
    # Works as alias for +Hash#[]+ method. If you specify the +:flat+ 
    # mode, array items will be treaten as arguments to +Hash#[]+ 
    # method.
    #
    # Should be noted, it cannot be named +#to_hash+, because #to_hash 
    # is called by the +Hash#[]+ itself. Reasons why it's absolutely 
    # undocumented call are unknown.
    #
    # @example Equivalent calls
    #   [["aa", "bb"], ["bb", "aa"]].to_h
    #   ["aa", "bb", "bb", "aa"].to_h(:flat)
    #
    # @param [Symbol] mode flat mode switch, can be +:flat+ or +nil+
    # @return [Hash] new hash
    # @see http://www.ruby-doc.org/core/classes/Hash.html#M000716
    # @since 0.4.0
    #
    
    def to_h(mode = nil)
        if mode == :flat
            Hash[*self]
        else
            Hash[self]
        end
    end
    
    ##
    # Merges arrays in place. It seems to be rather unuseful, but it's
    # intended for special cases, for example joining arrays while
    # constructing.
    #
    # An example (underlying object is extended array):
    #   def initialize(array)
    #       self += array       # impossible, will fail
    #       self.merge! array   # possible, of sure
    #   end
    #
    # @param [Array] arrays array for merge-in
    # @return [Array] self
    # @since 0.10.0
    #
    
    def merge!(*arrays)
        arrays.flatten! 1
        arrays.each { |i| self << i }
        self
    end
    
    ##
    # Returns the second item in the array.
    #
    # @return [Object] item of the array
    # @since 0.15.0
    #
    
    def second
        self[1]
    end
    
    ##
    # Returns the third item in the array.
    #
    # @return [Object] item of the array
    # @since 0.15.0
    #

    def third
        self[2]
    end
    
    ##
    # Returns the fourth item in the array.
    #
    # @return [Object] item of the array
    # @since 0.15.0
    #

    def fourth
        self[3]
    end
    
    ##
    # Returns the fifth item in the array.
    #
    # @return [Object] item of the array
    # @since 0.15.0
    #

    def fifth
        self[4]
    end
    
    ##
    # Returns the sixth item in the array.
    #
    # @return [Object] item of the array
    # @since 0.15.0
    #

    def sixth
        self[5]
    end
    
    ##
    # Returns the seventh item in the array.
    #
    # @return [Object] item of the array
    # @since 0.15.0
    #

    def seventh
        self[6]
    end
    
    ##
    # Returns the eighth item in the array.
    #
    # @return [Object] item of the array
    # @since 0.15.0
    #

    def eighth
        self[7]
    end
    
    ##
    # Returns sum of items in the array. If other than numeric type found,
    # it will be normally conacenated if it's possible. 
    #
    # @example
    #   array = [1, 2, 3]
    #   array.sum                           # will return 6
    #   array = ["a", "b", "c"]
    #   array.sum                           # will return "abc"
    #
    # @return [Object] result of summing
    # @since 0.16.0
    #
    
    def sum
        if @__sum_check_done \
            or RUBY_VERSION[0..2] == "1.9" \
            or RUBY_VERSION[0..4] == "1.8.7" \
            or (Gem::require_available("ruby-version") and Ruby::Version > [1, 8, 7])
            
            @__sum_check_done = true
            self.inject(:+)
        else
            first = true
            self.inject(self.first) do |sum, i|
                if first
                    first = false
                    sum
                else
                    sum += i
                end
            end
        end
    end
    
    ##
    # Returns average of items in the array. Numeric types are expected,
    # but content of the array isn't checked.
    #
    # @example
    #   array = [1, 2, 3]
    #   array.avg                           # will return 2
    #
    # @return [Numeric] result of averaging
    # @since 0.16.0
    #
    
    def avg
        self.sum.to_f / self.length
    end
    
    alias :average :avg
    
    ##
    # Indicates, object is +Array+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    def array?
        true
    end

    ##
    # Removes given value from the array. It's +nil+ by default, 
    # so behaves just as {#compact}.
    #
    # @param [Object] value  required value; uses +===+ 
    #   for comparing
    # @since 0.19.0
    #
    
    def clean(value = nil)
        self.reject! { |v| v === value }
    end
    
    ##
    # Removes given value from the array in place. It's +nil+ 
    # by default, so behaves just as {#compact}.
    #
    # @param [Object] value  required value; uses +===+ 
    #   for comparing
    # @since 0.19.0
    #
    
    def clean!(value = nil)
        self.reject! { |v| v === value }
    end
    
end
