# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "hash-utils/object"
require "ruby-version"

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
    
    if not self.__hash_utils_instance_respond_to? :remove!
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
    end
    
    ##
    # Checks, at least one value follows condition expressed in 
    # block. Block must return Boolean.
    #
    # @param [Proc] block checking block
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.2.0
    #
    
    if not self.__hash_utils_instance_respond_to? :some?
        alias :"some?" :"one?"
    end
    
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
    
    if not self.__hash_utils_instance_respond_to? :to_h
        def to_h(mode = nil)
            if mode == :flat
                Hash[*self]
            else
                Hash[self]
            end
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
    
    if not self.__hash_utils_instance_respond_to? :merge!
        def merge!(*arrays)
            arrays.flatten! 1
            self.push(*arrays)
            self
        end
    end
    
    ##
    # Returns the second item in the array.
    #
    # @return [Object] item of the array
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :second
        def second
            self[1]
        end
    end
    
    ##
    # Returns the third item in the array.
    #
    # @return [Object] item of the array
    # @since 0.15.0
    #

    if not self.__hash_utils_instance_respond_to? :third
        def third
            self[2]
        end
    end
    
    ##
    # Returns the fourth item in the array.
    #
    # @return [Object] item of the array
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :fourth
        def fourth
            self[3]
        end
    end
    
    ##
    # Returns the fifth item in the array.
    #
    # @return [Object] item of the array
    # @since 0.15.0
    #

    if not self.__hash_utils_instance_respond_to? :fifth
        def fifth
            self[4]
        end
    end
    
    ##
    # Returns the sixth item in the array.
    #
    # @return [Object] item of the array
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :sixth
        def sixth
            self[5]
        end
    end
    
    ##
    # Returns the seventh item in the array.
    #
    # @return [Object] item of the array
    # @since 0.15.0
    #

    if not self.__hash_utils_instance_respond_to? :seventh
        def seventh
            self[6]
        end
    end
    
    ##
    # Returns the eighth item in the array.
    #
    # @return [Object] item of the array
    # @since 0.15.0
    #

    if not self.__hash_utils_instance_respond_to? :eight
        def eighth
            self[7]
        end
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
    
    if not self.__hash_utils_instance_respond_to? :sum 
        if Ruby::Version >= [1, 8, 7]
            def sum
                self.inject(:+)
            end
        else
            def sum
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
    
    if not self.__hash_utils_instance_respond_to? :avg
        def avg
            self.sum.to_f / self.length
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :average
        alias :average :avg
    end
    
    ##
    # Indicates, object is +Array+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    if not self.__hash_utils_instance_respond_to? :array?
        def array?
            true
        end
    end

    ##
    # Removes given value from the array. It's +nil+ by default, 
    # so behaves just as {Array#compact}.
    #
    # @param [Object] value  required value; uses +===+ 
    #   for comparing
    # @since 0.19.0
    #
    
    if not self.__hash_utils_instance_respond_to? :clean
        def clean(value = nil)
            self.reject { |v| v === value }
        end
    end
    
    ##
    # Removes given value from the array in place. It's +nil+ 
    # by default, so behaves just as {Array#compact}.
    #
    # @param [Object] value  required value; uses +===+ 
    #   for comparing
    # @since 0.19.0
    #
    
    if not self.__hash_utils_instance_respond_to? :clean!
        def clean!(value = nil)
            self.reject! { |v| v === value }
        end
    end
    
    ##
    # Converts array to set. Includes sets before calling.
    #
    # @return [Set] new set
    # @since 2.0.0
    #
    
    if not self.__hash_utils_instance_respond_to? :to_set
        def to_set
            Set::new(self)
        end
    end

    ##
    # Performs array members interlacing in place. It means, it inserts 
    # given item between members of the array.
    #
    # @example
    #   [:a, :b, :c].interlace!("x")    # will return [:a, 'x', :b, 'x', :c] which will be in the variable
    #
    # @param [Object] object new member of the array
    # @return [Array] new interlaced array
    # @since 2.1.0
    # 
    
    if not self.__hash_utils_instance_respond_to? :interlace!
        def interlace!(*objects)
            self.expand_by!(*objects).cut! objects.length
        end        
    end

    ##
    # Performs array members interlacing. It means, it inserts 
    # given item between members of the array.
    #
    # @example
    #   [:a, :b, :c].interlace("x")    # will return [:a, 'x', :b, 'x', :c]
    #
    # @param [Object] object new member of the array
    # @return [Array] new interlaced array
    # @since 2.1.0
    # 
    
    if not self.__hash_utils_instance_respond_to? :interlace
        def interlace(*objects)
            self.dup.interlace! *objects
        end        
    end
    
    ##
    # Performs array expanding. It means, it inserts 
    # given items after each member of the array.
    #
    # @example
    #   [:a, :b, :c].expand_by(1, 2)    # will return [:a, 1, 2, :b, 1, 2, :c, 1, 2]
    #
    # @param *[Object] object new member of the array
    # @return [Array] new expanded array
    # @since 2.1.0
    # 
    
    if not self.__hash_utils_instance_respond_to? :expand_by
        def expand_by(*objects)
            self.dup.expand_by!(*objects)
        end        
    end
    
    ##
    # Performs array expanding in place. It means, it inserts 
    # given items after each member of the array.
    #
    # @example
    #   [:a, :b, :c].expand_by(1, 2)    # will return [:a, 1, 2, :b, 1, 2, :c, 1, 2]
    #
    # @param *[Object] object new member of the array
    # @return [Array] expanded array
    # @since 2.1.0
    # 
    
    if not self.__hash_utils_instance_respond_to? :expand_by!
        def expand_by!(*objects)
            if self.empty?
                self
            else
                self.map! { |i| i = [i]; i += objects }.flatten! 1
            end
        end        
    end
    
    ##
    # Cuts out given portion of the array from the end and returns 
    # remaining part in place.
    #
    # @example
    #   [1, 2, 3, 4, 5, 6].cut! 2     # will return [1, 2, 3, 4] which also be content of a variable
    #
    # @param [Integer] indexes  indexes to cut out
    # @return [Array] resultant array 
    # @since 2.1.0
    #
    
    if not self.__hash_utils_instance_respond_to? :cut!
        def cut!(length)
            delta = self.length - length
            
            if delta >= 0
                self.slice! delta..(self.length)
                self
            else
                self.clear
            end
        end        
    end
    
    ##
    # Cuts out given portion of the array from the end and returns 
    # remaining.
    #
    # @example
    #   [1, 2, 3, 4, 5, 6].cut! 2     # will return [1, 2, 3, 4]
    #
    # @param [Integer] indexes  indexes to cut out
    # @return [Array] resultant array 
    # @since 2.1.0
    #
    
    if not self.__hash_utils_instance_respond_to? :cut
        def cut(length)
            self.dup.cut! length
        end        
    end
    
    ##
    # Performs classical +#zip+ on array, but in place.
    #
    # @example
    #   arr = [1, 2, 3]
    #   arr.zip!
    #   arr == [1, 3, 4].zip    # will be true 
    #
    # @param *[Array] members
    # @return [Array]
    # @since 2.1.0
    #
    
    if not self.__hash_utils_instance_respond_to? :zip!
        def zip!(*members)
            self.map! { |i| [i] }
            lengths = [ ]
            
            # creates zip by hand
            members.each_index do |i|
                item = members[i]
                lengths << item.length
                
                item.each_index do |j|
                    self[j][i + 1] = item[j]
                end
            end
            
            # padds to fixed length according to longest
            if not lengths.empty?
                padding = lengths.max + 1
                self.each { |i| i.complete_to!(padding) }
            end
            
            return self
        end        
    end
    
    ##
    # Completes array to given length using given member. Shortens 
    # longer arrays.
    #
    # @example
    #   [1, 2, 3].complete_to(5, :a)    # will return [1, 2, 3, :a, :a]
    #
    # @param [Integer] length
    # @param [Object] member
    # @return [Array] resultant array
    # @since 0.2.1
    #
    
    if not self.__hash_utils_instance_respond_to? :complete_to
        def complete_to(length, member = nil)
            self.dup.complete_to!(length, member)
        end
    end
    
    ##
    # Completes array to given length using given member in place. 
    # Shortens longer arrays.
    #
    # @example
    #   x = [1, 2, 3]
    #   x = x.complete_to!(5, :a)    # will return [1, 2, 3, :a, :a]
    #
    # @param [Integer] length
    # @param [Object] member
    # @return [Array] itself
    # @since 0.2.1
    #
    
    if not self.__hash_utils_instance_respond_to? :complete_to!
        def complete_to!(length, member = nil)
            delta = length - self.length
            
            if delta > 0
                fill = [member] * delta 
                self.push(*fill) 
            elsif delta == 0
                self
            else
                self.shrink_to!(length)
            end
        end
    end
    
    ##
    # Shrinks array to given length. Ignores shorten arrays.
    #
    # @example
    #   [1, 2, 3, 4, 5].shrink_to(3)    # will return [1, 2, 3]
    #
    # @param [Integer] length
    # @return [Array] shorten array
    # 
    
    if not self.__hash_utils_instance_respond_to? :shrink_to
        def shrink_to(length)
            self.dup.shrink_to! length
        end
    end
    
    ##
    # Shrinks array to given length in place. Ignores shorten arrays.
    #
    # @example
    #   x = [1, 2, 3, 4, 5]
    #   x.shrink_to!(3)       # will return [1, 2, 3] 
    #
    # @param [Integer] length
    # @return [Array] shorten array
    # 
    
    if not self.__hash_utils_instance_respond_to? :shrink_to!
        def shrink_to!(length)
            delta = self.length - length
            
            if length < 0
                raise ::ArgumentError::new("negative argument")
            elsif delta > 0
                self.cut! self.length - length
            else
                self
            end
        end
    end
    
    ##
    # Make +#drop+, but in-place.
    #
    # @example
    #   x = [1, 2, 3, 4, 5]
    #   x.drop! 3     # will return [4, 5] which will be in the variable
    #
    # @param [Integer] length
    # @return [Array] remaining part
    #
    
    if not self.__hash_utils_instance_respond_to? :drop!
        def drop!(length)
            if length < 0
                raise ArgumentError::new('attempt to drop negative size')
            elsif length == 0
                self
            else
                self.slice! 0..(length - 1)
                self
            end
        end
    end
    
    #OK complete_to!
    #OK complete_to
    #OK drop!
    #OK cut
    #interlace
    #interlace!
    #OK cut!
    #OK zip!
    #OK shrink_to
    #OK shrink_to!
end

