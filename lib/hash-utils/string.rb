# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "ruby-version"
require "hash-utils/array"
require "hash-utils/hash"
require "hash-utils/object"

##
# String extension.
#

class String

    ##
    # Holds numeric matcher.
    # @since 0.3.0
    #
    
    if not self.constants.include? :NUMERIC
        NUMERIC = /^\s*-?\d+(?:\.\d+)?\s*$/
    end
    
    ##
    # Holds character interlacing matcher.
    # @since 0.18.1
    #
    
    if not self.constants.include? :INTERLACING
        INTERLACING = /(.)([^$])/
    end
    
    ##
    # Holds lower case alpha characters for random string generator.
    # @since 0.19.0
    #
    
    if not self.constants.include? :RANDOM_ALPHA_LOWER
        RANDOM_ALPHA_LOWER = "abcdefghijklmnopqrstuvwxyz"
    end
    
    ##
    # Holds upper case alpha characters for random string generator.
    # @since 0.19.0
    #
    
    if not self.constants.include? :RANDOM_ALPHA_UPPER
        RANDOM_ALPHA_UPPER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    end

    ##
    # Holds number characters list for random string generator.
    # @since 0.19.0
    #
    
    if not self.constants.include? :RANDOM_NUMBERS
        RANDOM_NUMBERS = "0123456789"
    end
    
    ##
    # Holds symbols list for random string generator.
    # @since 0.19.0
    #
    
    if not self.constants.include? :RANDOM_SYMBOLS
        RANDOM_SYMBOLS = "!\/#?.,_-+*@%&{}[]()=<>|~'$"
    end
    
    ##
    # Holds whitespace for random string generator.
    # @since 0.19.0
    #
    
    if not self.constants.include? :RANDOM_WHITESPACE
        RANDOM_WHITESPACE = " "
    end
    
    ##
    # Holds full spectrum of possible characters in random string generator.
    # @since 0.19.0
    #
    
    if not self.constants.include? :RANDOM_FULL
        RANDOM_FULL = self::RANDOM_ALPHA_LOWER + self::RANDOM_ALPHA_UPPER + self::RANDOM_NUMBERS + self::RANDOM_SYMBOLS + self::RANDOM_WHITESPACE
    end 
    
    ##
    # Returns random string.
    # 
    # @param [Integer] length  length of the required string
    # @param [String] characters  list of the characters
    # @return [String] new random string
    # @since 0.19.0
    #
    
    if not self.respond_to? :random
        def self.random(length, characters = self::RANDOM_FULL)
            result = ""
            max = characters.length
            length.times do
                result << characters[Kernel.rand(max)].chr
            end
            
            return result
        end
    end
    
    ##
    # Indicates, string is numeric, so consists of numbers only.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.3.0
    #
    
    if not self.__hash_utils_instance_respond_to? :numeric?
        def numeric?
            if self.match(self.class::NUMERIC)
                true
            else
                false
            end
        end
    end
    
    ##
    # Replaces set of substrings by another strings.
    #
    # It's equivalent of PHP +strtr()+ function. Supports all objects
    # convertable to String, but in that case you must give him block
    # which specifies how to map keys found in the string back to 
    # keys in definition Hash or Array.
    #
    # If you specify the +:flat+ mode, definition array items will be 
    # treaten as arguments to +Hash#[]+ method while internal conversion
    # +Array+ to +Hash+, so then can then use plain array as base for 
    # definitions. See {Array#to_h}. 
    #
    # @example Equivalent calls
    #   "aa bb".strtr("aa" => "bb", "bb" => "aa")
    #   "aa bb".strtr([["aa", "bb"], ["bb", "aa"]])
    #   "aa bb".strtr(["aa", "bb", "bb", "aa"], :flat)
    # @example Use with symbols
    # 	"aa bb".strtr(:aa => "bb", :bb => "aa") { |s| s.to_sym }
    #
    # @param [Array, Hash] replacements replacements definition
    # @param [Symbol] mode flat mode switch, can be +:flat+ or +nil+
    # @param [Proc] block with keys mapping worker (see description)
    # @return [String] string with applied replacements
    # @see http://www.php.net/strtr
    # @since 0.4.0
    #
    
    if not self.__hash_utils_instance_respond_to? :strtr
        def strtr(defs, mode = nil, &block)
            if block.nil?
                block = Proc::new { |s| s }
            end
            
            defs, matcher = __prepare_strtr(defs, mode)
            self.gsub(matcher) { |s| defs[block.call(s)] }
        end
    end
    
    ##
    # Replaces set of substrings by another strings -- in place.
    # See {#strtr} for details.
    #
    # @param [Array, Hash] replacements replacements definition
    # @param [Symbol] mode flat mode switch, can be +:flat+ or +nil+
    # @param [Proc] block with keys mapping worker (see description)
    # @return [String] string with applied replacements
    # @see #strtr
    # @since 0.4.0
    #
    
    if not self.__hash_utils_instance_respond_to? :strtr!
        def strtr!(defs, mode = nil, &block)
            if block.nil?
                block = Proc::new { |s| s }
            end
            
            defs, matcher = __prepare_strtr(defs, mode)
            self.gsub!(matcher) { |s| defs[block.call(s)] }
        end
    end
    
    ##
    # Converts String to Array of characters.
    #
    # @example
    #   foo = "012"
    #   puts foo.to_a.inspect   # prints out ["0", "1", "2"]
    #
    # @param String glue glue according to convert to array
    # @return [Array] array of single character strings
    # @since 0.6.0
    # 
    
    if not self.__hash_utils_instance_respond_to? :to_a
        def to_a(glue = "")
            self.split(glue)
        end
    end
    
    ##
    # Applies block to each character and returns resultant string.
    #
    # @example
    #   foo = "012"
    #   puts foo.map { |ch| (ch.to_i + 1).to_s }.inspect   # prints out "123"
    #
    # @param [Proc] block transforming block
    # @param [String] transformed string
    # @since 0.6.0
    #
    
    if not self.__hash_utils_instance_respond_to? :map
        def map(&block)
            buffer = " " * self.length
            self.length.times do |i|
                buffer[i] = block.call(self[i])
            end
                    
            return buffer
        end
    end
    
    ##
    # Applies block to each character in place. For example see {#map}.
    #
    # @param [Proc] block transforming block
    # @return [String] self
    # @since 0.6.0
    # @see #map
    #
    
    if not self.__hash_utils_instance_respond_to? :map!
        def map!(&block)
            self.length.times do |i|
                self[i] = block.call(self[i])
            end
            
            return self
        end
    end
    
    ##
    # Replaces all substrings defined by Regexp by complex way. It 
    # means, it gives to block not only whole match, but submatches too.
    # In fact, emulates PHP's +preg_replace_callback()+ function. 
    # In other ways emulates standard +#gsub+.
    # 
    # @param [Regexp] regexp matching expression
    # @param [String] to new string
    # @param [Proc] block block which will receive each match
    # @return [String] resultant string
    # @see http://www.php.net/preg_replace_callback
    # @since 0.8.0
    #

    if not self.__hash_utils_instance_respond_to? :gsub_f
        def gsub_f(from, to = nil, &block) 
            __prepare_gsub_f(from, to, block) do |callback|
                if to.nil?
                    self.gsub(from, &callback)
                else
                    self.gsub(from, to)
                end
            end
        end
    end
    
    ##
    # Performs complex regexp replacing same as {#gsub_f}, but in place.
    # In other ways emulates standard +#gsub!+.
    #
    # @param [Regexp] from matching expression
    # @param [String] to new string
    # @param [Proc] block block which will receive each match
    # @return [String] resultant string    
    # @see #gsub_f
    # @since 0.8.0
    #

    if not self.__hash_utils_instance_respond_to? :gsub_f!
        def gsub_f!(from, to = nil, &block) 
            __prepare_gsub_f(from, to, block) do |callback|
                if to.nil?
                    self.gsub!(from, &callback)
                else
                    self.gsub!(from, to)
                end
            end
            
            return self
        end
    end
        
    ##
    # Returns first character of the string.
    #
    # @example
    #   "abc".first     # will return 'a'
    #
    # @return [String] first character
    # @since 0.11.0
    #
    
    if not self.__hash_utils_instance_respond_to? :first
        def first
            self.chr
        end
    end
        
    ##
    # Returns second character of the string.
    #
    # @return [String] second character
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :second 
        def second
            self[1].chr
        end
    end
    
    ##
    # Returns third character of the string.
    #
    # @return [String] third character
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :third
        def third
            self[2].chr
        end
    end
    
    ##
    # Returns fourth character of the string.
    #
    # @return [String] fourth character
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :fourth
        def fourth
            self[3].chr
        end
    end
    
    ##
    # Returns fifth character of the string.
    #
    # @return [String] fifth character
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :fifth
        def fifth
            self[4].chr
        end
    end
    
    ##
    # Returns sixth character of the string.
    #
    # @return [String] sixth character
    # @since 0.15.0
    #

    if not self.__hash_utils_instance_respond_to? :sixth
        def sixth
            self[5].chr
        end
    end
    
    ##
    # Returns seventh character of the string.
    #
    # @return [String] seventh character
    # @since 0.15.0
    #

    if not self.__hash_utils_instance_respond_to? :seventh
        def seventh
            self[6].chr
        end
    end
    
    ##
    # Returns eighth character of the string.
    #
    # @return [String] eighth character
    # @since 0.15.0
    #

    if not self.__hash_utils_instance_respond_to? :eighth 
        def eighth
            self[7].chr
        end
    end
    
    ##
    # Returns last character of the string.
    #
    # @example
    #   "abc".last     # will return 'c'
    #
    # @return [String] last character
    # @since 0.11.0
    #
    
    if not self.__hash_utils_instance_respond_to? :last
        def last
            self[-1].chr
        end
    end
    
    ##
    # Returns required count of lines from beginning of string.
    #
    # @example
    #   "a\nb\nc\nd\n".first_lines(2)
    #   # will return ["a\n", "b\n"]   
    #
    # @note Works well for UNIX strings only. Convert your string 
    #   if necessary.
    # @param [Integer] count required count of lines
    # @return [Array] array of lines
    # @since 0.12.0
    #
    
    if not self.__hash_utils_instance_respond_to? :first_lines
        def first_lines(count = 1)
            result = [ ]
            self.each_line do |line|
                count -= 1
                result << line
                break if count == 0
            end
            
            return result
        end
    end
    
    ##
    # Returns first line of the string.
    #
    # @example
    #   "a\nb\nc\nd\n".first_line
    #   # will return "a\n"
    #
    # @note Works well for UNIX strings only. Convert your string 
    #   if necessary.
    # @return [String] line with +\n+
    # @since 0.12.0
    #
    
    if not self.__hash_utils_instance_respond_to? :first_line    
        def first_line
            self.first_lines.first
        end
    end

    ##
    # Returns required count of lines from end of string.
    #
    # @example
    #   "a\nb\nc\nd".last_lines(2)
    #   # will return ["c\n", "d"]   
    #
    # @note Works well for UNIX strings only. Convert your string 
    #   if necessary.
    # @param [Integer] count required count of lines
    # @return [Array] array of lines
    # @since 0.12.0
    #
    
    if not self.__hash_utils_instance_respond_to? :last_lines
        def last_lines(count = 1)
            buffer = ""
            result = [ ]
            (self.length - 1).downto(0) do |i|
                chr = self[i]
                if chr.ord == 10
                    count -= 1
                    result << buffer.reverse!
                    buffer = ""
                    break if count == 0
                end
                buffer << chr.chr
            end
    
            if count != 0
                result << buffer.reverse!
            end
            return result.reverse!
        end
    end
    
    ##
    # Returns last line of the string.
    #
    # @example
    #   "a\nb\nc\nd".last_line
    #   # will return "d"
    #
    # @note Works well for UNIX strings only. Convert your string 
    #   if necessary.
    # @return [String] line
    # @since 0.12.0
    #
    
    if not self.__hash_utils_instance_respond_to? :last_line    
        def last_line
            self.last_lines.last
        end
    end
    
    ##
    # Removes given count of lines from beginning of file.
    #
    # @example 
    #   str = "a\nb\nc\nd"
    #
    #   str.shift_lines(2)
    #   # will return ["a\n", "b\n"]      
    #   p str
    #   # will print out "c\nd"
    #
    # @note Works well for UNIX strings only. Convert your string 
    #   if necessary.
    # @param [Integer] count required number of lines
    # @return [Array] removed lines
    # @since 0.12.0
    #
    
    if not self.__hash_utils_instance_respond_to? :shift_lines
        def shift_lines(count = 1)
            lines = self.first_lines(count)
            length = lines.reduce(0) { |sum, i| sum + i.length }
            self.replace(self[length..-1])
            return lines
        end
    end
    
    ##
    # Removes first line out from the string and returns it.
    #
    # @return [String] removed line
    # @since 0.12.0
    #
    
    if not self.__hash_utils_instance_respond_to? :shift_line
        def shift_line
            self.shift_lines.first
        end
    end
        
    ##
    # Puts lines to begin of string.
    #
    # @param [Array] lines line bodies without +\n+
    # @return [String] itself
    # @since 0.12.0
    #
    
    if not self.__hash_utils_instance_respond_to? :unshift_lines
        def unshift_lines(*lines)
            self.unshift(lines.join("\n") << "\n")
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :unshift_line
        alias :unshift_line :unshift_lines
    end
    
    ##
    # Removes lines out of end of the string.
    #
    # @note Works well for UNIX strings only. Convert your string 
    #   if necessary.
    # @param [Integer] count required number of lines
    # @return [Array] removed lines
    # @since 0.12.0
    #
    
    if not self.__hash_utils_instance_respond_to? :pop_lines
        def pop_lines(count = 1)
            lines = self.last_lines(count)
            length = lines.inject(0) { |sum, i| sum + i.length }
            self.replace(self[0..(length - 1)])
            return lines
        end
    end

    ##
    # Removes last line out from the string and returns it.
    # @return [String] removed line
    #
    
    if not self.__hash_utils_instance_respond_to? :pop_line
        def pop_line
            self.pop_lines.first
        end
    end
    
    ##
    # Joins lines to string.
    #
    # @param [Array] lines line bodies without +\n+
    # @return [String] itself
    # @since 0.12.0
    #
       
    if not self.__hash_utils_instance_respond_to? :push_lines 
        def push_lines(*lines)
            self.push("\n" << lines.join("\n"))
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :push_line
        alias :push_line :push_lines
    end
    
    if not self.__hash_utils_instance_respond_to? :push
        alias :push :<<
    end
    
    ##
    # Removes appropriate number of characters from end of string.
    #
    # @param [Integer] count required number of characters
    # @return [String] removed characters
    # @since 0.12.0
    #
    
    if not self.__hash_utils_instance_respond_to? :pop
        def pop(count = 1)
            res = self[(self.length - count)..-1]
            self.replace(self[0..-(count + 1)])
            return res
        end
    end
    
    ##
    # Removes appropriate number of characters from begin of string.
    #
    # @param [Integer] count required number of characters
    # @return [String] removed characters
    # @since 0.12.0
    #
    
    if not self.__hash_utils_instance_respond_to? :shift
        def shift(count = 1)
            res = self[0...count]
            self.replace(self[count..-1])
            return res
        end
    end

    if Ruby::Version < [1, 9, 3]
      
        ##
        # Puts content to begin of string.
        #
        # @note Since Ruby 1.9.3 replaced by STL native version.
        #
        # @param [String] string string for prepend
        # @return [String] itself
        # @since 0.12.0
        #
        
        if not self.__hash_utils_instance_respond_to? :unshift
            def unshift(string)
                self.replace(string + self)
            end
        end    
        
        if not self.__hash_utils_instance_respond_to? :prepend
            alias :prepend :unshift
        end
    else
        if not self.__hash_utils_instance_respond_to? :unshift
            alias :unshift :prepend
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :append
        alias :append :<<
    end
    
    ##
    # Converts first character of the string to uppercase.
    #
    # @return [String] new string
    # @see http://www.php.net/ucfirst
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :ucfirst
        def ucfirst
            self.dup.ucfirst!
        end
    end
    
    ##
    # Converts first character of the string to uppercase in place.
    #
    # @return [String] new string
    # @see http://www.php.net/ucfirst
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :ucfirst!
        def ucfirst!
            self[0] = self.first.upcase
            return self
        end
    end

    ##
    # Converts first character of the string to lowercase.
    #
    # @return [String] new string
    # @see http://www.php.net/lcfirst
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :lcfirst
        def lcfirst
            self.dup.lcfirst!
        end
    end
    
    ##
    # Converts first character of the string to lowercase in place.
    #
    # @return [String] new string
    # @see http://www.php.net/lcfirst
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :lcfirst! 
        def lcfirst!
            self[0] = self.first.downcase
            return self
        end
    end
    
    ##
    # Indicates, object is +String+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    if not self.__hash_utils_instance_respond_to? :string?
        def string?
            true
        end
    end
    
    ##
    # Swaps two strings. Return new content of self.
    #
    # @param [String] from source string
    # @return [String] new content of self
    # @since 0.18.0
    #
    
    if not self.__hash_utils_instance_respond_to? :swap_with
        def swap_with(from)
            intermediate = self.dup
            self.replace(from)
            from.replace(intermediate)
            return self
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :swap_with!    
        alias :swap_with! :swap_with
    end
    
    ##
    # Cuts string in place. Sets the content of #[] on place of 
    # the string.
    #
    # @param [Range] range range with from and to limits
    # @return [String] itself
    # @since 0.18.0
    #
    
    if not self.__hash_utils_instance_respond_to? :cut!
        def cut!(range)
            self.replace(self[range])
        end
    end

    ##
    # Performs string interlacing. It means, it inserts given string
    # between characters of the string.
    #
    # @example
    #   "abc".interlace("123")    # will return "a123b123c"
    #
    # @param [String] string string which will interlaced to
    # @return [String] new interlaced string
    # @since 0.18.1
    # 
    
    if not self.__hash_utils_instance_respond_to? :interlace
        def interlace(string)
            self.gsub(self.class::INTERLACING, '\1' << string << '\2' << string)
        end
    end
    
    ##
    # Performs string interlacing in place. 
    #
    # @param [String] string string which will interlaced to
    # @return [String] itself
    # @see #interlace
    # @since 0.18.1
    # 
    
    if not self.__hash_utils_instance_respond_to? :interlace!
        def interlace!(string)
            self.gsub!(self.class::INTERLACING, '\1' << string << '\2' << string)
            return self
        end
    end
    
    ##
    # Converts string to boolean. Note, it works differently than 
    # {Object#to_b} because it converts to boolean by comparing in 
    # contrast to +#to_b+ which converts by regular Ruby object boolean
    # evaluation.
    #
    # @param [Object] t  true equivalent
    # @return [Boolean] result of conversion
    # @since 0.19.0
    #
    
    if not self.__hash_utils_instance_respond_to? :to_boolean
        def to_boolean(t = "true")
            self == t
        end
    end
    
    
    private
    
    ##
    # Prepares matcher for #strtr.
    #
    
    def __prepare_strtr(defs, mode = nil)
        defs = defs.to_h(mode)
        keys = defs.keys
        keys.map! { |i| i.to_s }

        matcher = Regexp::new("(" + keys.join("|") + ")")
        return [defs, matcher]
    end
    
    ## 
    # Prepares #gsub_f family methods.
    #
    
    def __prepare_gsub_f(from, to = nil, callback = nil, &block)
        if not callback.nil?
            newcall = Proc::new do |s|
                callback.call(s.match(from))
            end
        end
        
        block.call(newcall)
    end
    
end

