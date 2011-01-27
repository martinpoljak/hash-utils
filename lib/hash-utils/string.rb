# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "hash-utils/array"
require "hash-utils/hash"

##
# String extension.
#

class String
    ##
    # Holds numeric matcher.
    #
    
    NUMERIC = /^\s*-?\d+(?:\.\d+)?\s*$/
    
    ##
    # Indicates string is in some object which supports +#include?+.
    #
    # @param [Object] range container for analyzing
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.3.0
    #
    
    def in?(range)
        range.include? self
    end
    
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
    
    def tr(defs, mode = nil, &block)
        if block.nil?
            block = Proc::new { |s| s }
        end
        
        defs, matcher = __prepare_tr(defs, mode)
        self.gsub(matcher) { |s| defs[block.call(s)] }
    end
    
    
    private
    
    ##
    # Prepares matcher for #tr.
    #
    
    def __prepare_tr(defs, mode = nil)
        defs = defs.to_h(mode)
        keys = defs.keys
        keys.map! { |i| i.to_s }

        matcher = Regexp::new("(" << keys.join("|") << ")")
        return [defs, matcher]
    end
    
end

