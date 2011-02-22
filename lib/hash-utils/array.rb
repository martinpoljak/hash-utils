# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# Array extension.
#

class Array

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
    
    alias :some? :one?
    
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
        arrays.flatten!(1)
        arrays.each { |i| self << i }
        self
    end
    
end
