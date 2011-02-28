# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "hash-utils/array"
require "hash-utils/hash"
require "hash-utils/object"

##
# String extension.
#

class String
    ##
    # Holds numeric matcher.
    #
    
    NUMERIC = /^\s*-?\d+(?:\.\d+)?\s*$/
    
    ##
    # Indicates, string is numeric, so consists of numbers only.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.3.0
    #
    
    def numeric?
        if self.match(self.class::NUMERIC)
            true
        else
            false
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
    #   "aa bb".tr("aa" => "bb", "bb" => "aa")
    #   "aa bb".tr([["aa", "bb"], ["bb", "aa"]])
    #   "aa bb".tr(["aa", "bb", "bb", "aa"], :flat)
    # @example Use with symbols
    # 	"aa bb".tr(:aa => "bb", :bb => "aa") { |s| s.to_sym }
    #
    # @param [Array, Hash] replacements replacements definition
    # @param [Symbol] mode flat mode switch, can be +:flat+ or +nil+
    # @param [Proc] block with keys mapping worker (see description)
    # @return [String] string with applied replacements
    # @see http://www.php.net/strtr
    # @since 0.4.0
    #
    
    def strtr(defs, mode = nil, &block)
        if block.nil?
            block = Proc::new { |s| s }
        end
        
        defs, matcher = __prepare_strtr(defs, mode)
        self.gsub(matcher) { |s| defs[block.call(s)] }
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
    
    def strtr!(defs, mode = nil, &block)
        if block.nil?
            block = Proc::new { |s| s }
        end
        
        defs, matcher = __prepare_strtr(defs, mode)
        self.gsub!(matcher) { |s| defs[block.call(s)] }
    end
    
    ##
    # Converts String to Array of characters.
    #
    # @example
    #   foo = "012"
    #   puts foo.to_a.inspect   # prints out ["0", "1", "2"]
    #
    # @return [Array] array of single character strings
    # @since 0.6.0
    # 
    
    def to_a
        self.split("")
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
    
    def map(&block)
        buffer = " " * self.length
        self.length.times do |i|
            buffer[i] = block.call(self[i])
        end
                
        return buffer
    end
    
    ##
    # Applies block to each character in place. For example see {#map}.
    #
    # @param [Proc] block transforming block
    # @return [String] self
    # @since 0.6.0
    # @see #map
    #
    
    def map!(&block)
        self.length.times do |i|
            self[i] = block.call(self[i])
        end
        
        self
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

    def gsub_f(from, to = nil, &block) 
        __prepare_gsub_f(from, to, block) do |callback|
            if to.nil?
                self.gsub(from, &callback)
            else
                self.gsub(from, to)
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

    def gsub_f!(from, to = nil, &block) 
        __prepare_gsub_f(from, to, block) do |callback|
            if to.nil?
                self.gsub!(from, &callback)
            else
                self.gsub!(from, to)
            end
        end
        
        self
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
    
    def first
        self[0].chr
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
    
    def last
        self[-1].chr
    end
    
    
    
    private
    
    ##
    # Prepares matcher for #strtr.
    #
    
    def __prepare_strtr(defs, mode = nil)
        defs = defs.to_h(mode)
        keys = defs.keys
        keys.map! { |i| i.to_s }

        matcher = Regexp::new("(" << keys.join("|") << ")")
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

