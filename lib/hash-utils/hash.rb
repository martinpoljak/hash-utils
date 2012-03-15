# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "hash-utils/object"
require "hash-utils/array"

##
# Hash extension.
#

class Hash

    ##
    # Defines hash by setting the default value or an +Proc+ 
    # and content.
    #
    # @param [Hash] values  initial values
    # @param [Object] default  default value
    # @param [Proc] block  default block
    # @return [Hash] new hash
    # @since 0.3.0
    #
    
    if not self.respond_to? :define 
        def self.define(values = { }, default = nil, &block) 
            hash = self[values]
            self::create(default, hash, &block)
        end
    end
    
    ##
    # Creates hash by setting default settings in one call.
    #
    # @param [Hash] values  initial values
    # @param [Object] default  default value
    # @param [Proc] block  default block
    # @return [Hash] new hash
    # @since 0.3.0
    #
    
    if not self.respond_to? :create 
        def self.create(default = nil, hash = { }, &block)
            hash.default = default
            hash.default_proc = block if not block.nil?
            return hash        
        end
    end

    ##
    # Recreates the hash, so creates empty one and assigns
    # the same default values.
    #
    # @return [Hash] new hash
    # @since 0.3.0
    #

    if not self.__hash_utils_instance_respond_to? :recreate    
        def recreate
            self.class::create(self.default, &self.default_proc)
        end
    end
    
    ##
    # Recreates the hash in place, so creates empty one, assigns
    # the same default values and replaces the old one.
    #
    # @return [Hash] new hash
    # @since 0.3.0
    #
    
    if not self.__hash_utils_instance_respond_to? :recreate! 
        def recreate!
            self.replace(self.recreate)
        end
    end

    ##
    # Moves selected pairs outside the hash, so returns them.
    # Output hash has the same default settings.
    #
    # @param [Proc] block selecting block
    # @return [Hash] removed selected pairs
    # @since 0.3.0
    #
    
    if not self.__hash_utils_instance_respond_to? :remove!
        def remove!(&block)
            result = self.recreate
            delete = [ ]
            
            self.each_pair do |k, v|
                if block.call(k, v)
                    result[k] = v
                    delete << k
                end
            end
            
            delete.each do |k|
                self.delete(k)
            end
            
            return result
        end
    end
        
    ##
    # Removes given value from the hash. It's +nil+ by default, 
    # so behaves just as {#compact}.
    #
    # @param [Object] value  required value; uses +===+ 
    #   for comparing
    # @since 0.19.0
    #
    
    def clean(value = nil)
        self.reject { |k, v| v === value }
    end
    
    ##
    # Removes given value from the hash in place. It's +nil+ 
    # by default, so behaves just as {#compact}.
    #
    # @param [Object] value  required value; uses +===+ 
    #   for comparing
    # @since 0.19.0
    #
    
    def clean!(value = nil)
        self.reject! { |k, v| v === value }
    end
    
    ##
    # Returns a copy of +self+ with all +nil+ elements removed.
    #
    # @return [Hash] new hash
    # @since 0.1.0
    #

    if not self.__hash_utils_instance_respond_to? :compact
        alias :compact :clean
    end
    
    ##
    # Removes +nil+ elements from the hash. Returns +nil+ 
    # if no changes were made, otherwise returns +self+.
    #
    # @return [Hash] new hash
    # @since 0.1.0
    #
    
    if not self.__hash_utils_instance_respond_to? :compact!
        alias :compact! :clean!
    end
    
    ##
    # Returns a new hash with the results of running block once for 
    # every pair in +self+.
    #
    # @param [Proc] block evaluating block
    # @return [Hash] new hash
    # @since 0.1.0
    # 
    
    if not self.__hash_utils_instance_respond_to? :map_pairs
        def map_pairs(&block)
            _new = self.recreate
            
            self.each_pair do |k, v|
                new_k, new_v = block.call(k, v)
                _new[new_k] = new_v
            end
            
            return _new
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :collect_pairs
        alias :collect_pairs :map_pairs
    end
    
    ##
    # Emulates {#map_pairs} on place. In fact, replaces old hash by 
    # new one.
    #
    # @param [Proc] block evaluating block
    # @return [Hash] new hash
    # @since 0.1.0
    #
    
    if not self.__hash_utils_instance_respond_to? :map_pairs!
        def map_pairs!(&block)
            self.replace(self.map_pairs(&block))
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :collect_pairs!
        alias :collect_pairs! :map_pairs!
    end
    
    ##
    # Returns a new hash with the results of running block once for 
    # every key in +self+.
    #
    # @param [Proc] block evaluating block
    # @return [Hash] new hash
    # @since 0.1.0
    #
    
    if not self.__hash_utils_instance_respond_to? :map_keys
        def map_keys(&block)
            self.map_pairs do |k, v|
                [block.call(k), v]
            end
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :collect_keys    
        alias :collect_keys :map_keys
    end
    
    ##
    # Emulates {#map_keys} on place. In fact, replaces old hash by 
    # new one.
    #
    # @param [Proc] block evaluating block
    # @return [Hash] new hash
    # @since 0.1.0
    #
    
    if not self.__hash_utils_instance_respond_to? :map_keys!
        def map_keys!(&block)
            self.replace(self.map_keys(&block))
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :collect_keys!
        alias :collect_keys! :map_keys!
    end
    
    ##
    # Returns a new hash with the results of running block once for 
    # every value in +self+.
    #
    # @param [Proc] block evaluating block
    # @return [Hash] new hash
    # @since 0.11.0
    #
    
    if not self.__hash_utils_instance_respond_to? :map_values
        def map_values(&block)
            self.map_pairs do |k, v|
                [k, block.call(v)]
            end
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :collect_values
        alias :collect_values :map_values
    end
    
    ##
    # Emulates {#map_values} on place. In fact, replaces old hash by 
    # new one.
    #
    # @param [Proc] block evaluating block
    # @return [Hash] new hash
    # @since 0.11.0
    #
    
    if not self.__hash_utils_instance_respond_to? :map_values!
        def map_values!(&block)
            self.replace(self.map_values(&block))
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :collect_values!    
        alias :collect_values! :map_values!
    end
    
    ##
    # Converts all keys to symbols. Since version +0.14.1+ converts 
    # only +String+ keys to symbols.
    #
    # @return [Hash] new hash
    # @since 0.1.0
    #
    
    if not self.__hash_utils_instance_respond_to? :keys_to_sym
        def keys_to_sym
            self.map_keys do |k| 
                if k.kind_of? String
                    k.to_sym 
                else
                    k
                end
            end
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :symbolize_keys    
        alias :symbolize_keys :keys_to_sym
    end
    
    ##
    # Emulates {#keys_to_sym} on place. In fact, replaces old hash by 
    # new one.
    #
    # @return [Hash] new hash
    # @since 0.1.0
    #
    
    if not self.__hash_utils_instance_respond_to? :keys_to_sym!
        def keys_to_sym!
            self.replace(self.keys_to_sym)
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :symbolize_keys!
        alias :symbolize_keys! :keys_to_sym!
    end
    
    ##
    # Checks, all elements follow condition expressed in block.
    # Block must return boolean.
    #
    # If it's empty, returns +true+.
    #
    # @param [Proc] block checking block
    # @return [Boolean] +true+ if yes, +false+ in otherwise 
    # @note Since version 0.13.0 will be replaced by an alias to 
    #   Ruby built-in +#all?+.
    # @since 0.2.0
    #

    if not self.__hash_utils_instance_respond_to? :all_pairs?    
        def all_pairs?(&block)
            return true if self.empty?
            
            self.each_pair do |k, v|
                if block.call(k, v) == false
                    return false
                end
            end
            
            return true
        end
    end
    
    ##
    # Checks, at least one element value follows condition expressed in 
    # block. Block must return boolean.
    #
    # @param [Proc] block checking block
    # @return [Boolean] +true+ if yes, +false+ in otherwise 
    # @since 0.2.0
    #

    if not self.__hash_utils_instance_respond_to? :some?    
        def some?(&block)
            self.one? do |pair|
                block.call(pair[1])
            end
        end
    end
       
    ##
    # Checks, at least one element follows condition expressed in 
    # block. Block must return boolean.
    #
    # @param [Proc] block checking block
    # @return [Boolean] +true+ if yes, +false+ in otherwise 
    # @since 0.2.0
    #
    
    if not self.__hash_utils_instance_respond_to? :some_pairs?
        alias :some_pairs? :one?
    end
    
    ##
    # Compatibility method with {Array#to_h}. Returns itself.
    #
    # @return [Hash] itself
    # @since 0.4.0
    #
    
    if not self.__hash_utils_instance_respond_to? :to_h
        def to_h(mode = nil)
            self
        end
    end
    
    ##
    # Simulates sorting in place. In fact, replaces old one by new one.
    #
    # @param [Proc] block comparing block (see similar for #sort method)
    # @return [Hash] new sorted hash
    # @since 0.5.0
    #
    
    if not self.__hash_utils_instance_respond_to? :sort!
        def sort!(&block)
            self.replace(Hash[self.sort(&block)])
        end
    end
    
    ##
    # Sorts hash according to keys. It's equivalent of PHP ksort().
    #
    # Be warn, this method have sense in Ruby 1.9 only. Ruby 1.8 doesn't
    # maintain pair order in Hashes.
    #
    # @param [Proc] block comparing block (see similar for #sort method)
    # @return [Hash] new sorted hash
    # @see http://www.igvita.com/2009/02/04/ruby-19-internals-ordered-hash/
    # @see http://www.php.net/ksort
    # @since 0.5.0
    #
    
    if not self.__hash_utils_instance_respond_to? :ksort 
        def ksort(&block)
            if block.nil?
               block = Proc::new { |a, b| a <=> b }
            end
            Hash[self.sort { |a, b| block.call(a[0], b[0]) }]
        end
    end
    
    ##
    # Sorts hash according to keys, replaces the original one.
    # 
    # @param [Proc] block comparing block (see similar for #sort method)
    # @return [Hash] new sorted hash
    # @see #ksort
    # @since 0.5.0
    #

    if not self.__hash_utils_instance_respond_to? :ksort!
        def ksort!(&block)
            self.replace(self.ksort(&block))
        end
    end
        
    ##
    # Sorts hash according to values. Keeps key associations.
    # It's equivalent of PHP asort().
    #
    # Be warn, this method have sense in Ruby 1.9 only. Ruby 1.8 doesn't
    # maintain pair order in Hashes. 
    #
    # @param [Proc] block comparing block (see similar for #sort method)
    # @return [Hash] new sorted hash
    # @see http://www.igvita.com/2009/02/04/ruby-19-internals-ordered-hash/
    # @see http://www.php.net/asort
    # @since 0.5.0
    #
    
    if not self.__hash_utils_instance_respond_to? :asort 
        def asort(&block)
            if block.nil?
               block =  Proc::new { |a, b| a <=> b }
            end
            Hash[self.sort { |a, b| block.call(a[1], b[1]) }]
        end
    end
    
    ##
    # Sorts hash according to values, replaces the original one.
    # 
    # @param [Proc] block comparing block (see similar for #sort method)
    # @return [Hash] reversed hash
    # @see #asort
    # @since 0.5.0
    #
    
    if not self.__hash_utils_instance_respond_to? :asort! 
        def asort!(&block)
            self.replace(self.asort(&block))
        end
    end
    
    ##
    # Reverses order of the hash pairs.
    #
    # Be warn, this method have sense in Ruby 1.9 only. Ruby 1.8 doesn't
    # maintain pair order in Hashes.
    #
    # @return [Hash] reversed hash
    # @since 0.5.0
    #
    
    if not self.__hash_utils_instance_respond_to? :reverse
        def reverse
            Hash[self.to_a.reverse]
        end
    end
    
    ##
    # Reverses order of the hash pairs, replaces the original one.
    #
    # @return [Hash] reversed hash
    # @since 0.5.0
    #
    
    if not self.__hash_utils_instance_respond_to? :reverse!
        def reverse!
            self.replace(self.reverse)
        end
    end
    
    ##
    # Indicates, all of the keys are available in Hash.
    #
    # @param [Array] keys objects for checking
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.9.0
    #
    
    if not self.__hash_utils_instance_respond_to? :has_all?
        def has_all?(keys)
            keys.each do |key|
                if not self.has_key? key
                    return false
                end
            end
            
            return true
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :has_keys?
        alias :has_keys? :has_all?
    end
    
    ##
    # Indicates, some of the keys are available in Hash.
    #
    # @param [Array] keys objects for checking
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.9.0
    #
    
    if not self.__hash_utils_instance_respond_to? :has_some?
        def has_some?(keys)
            keys.each do |key|
                if self.has_key? key
                    return true
                end
            end
            
            return false
        end
    end
    
    ##
    # Combines two arrays to Hash. First array will be keys, second one
    # will be values.
    #
    # @example
    #   keys = [:a, :b, :c]
    #   values = [1, 2, 3]
    #
    #   Hash::combine(keys, values)     # will return {:a => 1, :b => 2, :c => 3}
    #
    # @param [Array] keys keys
    # @param [Array] values values
    # @return [Hash] resultant hash
    # @since 0.10.0
    #
    
    if not self.respond_to? :combine 
        def self.combine(keys, values)
            result = { }
            keys.each_index do |i|
                result[keys[i]] = values[i]
            end
            
            return result
        end
    end
    
    ##
    # Merges two hashes recursively in place. Receives unlimited
    # count of hashes for merging them in left to right order.
    #
    # @param [*Hash] hashs for merge from
    # @return [Hash] hash for merge to
    # @since 0.12.0
    #
    
    if not self.__hash_utils_instance_respond_to? :deep_merge!
        def deep_merge!(*args)
            fm = args.map { |hash| [self, hash] }
            
            while not fm.empty?
                _in, _out = fm.shift
                _out.each_pair do |k, v|
                    if v.kind_of? Hash
                        fm << [_in[k], _out[k]]
                    else
                        _in[k] = v
                    end
                end
            end
            
            return self
        end
    end
    
    ##
    # Merges two hashes recursively and returns new +Hash+. Receives 
    # unlimited count of hashes for merging them in left to right order.
    # Included hashes will be copied too.
    #
    # @param [*Hash] hashes for merge from
    # @return [Hash] hash for merge to
    # @since 0.12.0
    #
    
    if not self.__hash_utils_instance_respond_to? :deep_merge
        def deep_merge(*args)
            result = self.dup
            fm = args.map { |hash| [result, hash] }
    
            while not fm.empty?
                _in, _out = fm.shift
                _out.each_pair do |k, v|
                    if _in[k].kind_of? Hash
                        _in[k] = _in[k].dup
                        fm << [_in[k], _out[k]]
                    else
                        _in[k] = v
                    end
                end
            end
    
            return result
        end
    end
        
    ##
    # Iterates through items with given key only. None-existing values 
    # are ignored.
    #
    # @param [*Object] keys    
    # @yield [Array] pairs
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :get_pairs
        def get_pairs(*args)
            self.take_pairs(*args) do |i|
                if not i[1].nil?
                    yield i
                end
            end
        end
    end
      
    ##
    # Returns items from +Hash+ under given keys in required order. 
    # Doesn't keep default values settings. None-existing values are 
    # ignored.
    #
    # @example
    #   hash = {:a => 1, :b => 2, :c => 3}
    #   hash.get_items(:a, :c, :d)                # will return {:a => 1, :c => 3}
    #    
    # @param [*Object] keys
    # @return [Hash] new hash
    # @since 0.15.0
    #

    if not self.__hash_utils_instance_respond_to? :get_items 
        def get_items(*args)
            result = { }
            self.get_pairs(*args) do |key, value|
                result[key] = value
            end
            
            return result
        end
    end
   
    ##
    # Returns values from +Hash+ under given keys in required order. 
    #
    # @example
    #   hash = {:a => 1, :b => 2, :c => 3}
    #   hash.get_values(:a, :c, :d)            # will return [1, 3]
    #    
    # @param [*Object] keys
    # @return [Array] array of values
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :get_values
        def get_values(*args)
            result = [ ]
            self.get_pairs(*args) do |key, value|
                result << value
            end
            
            return result
        end
    end
    
    ##
    # Iterates through items with given key only including none-existing 
    # values.
    #
    # @param [*Object] keys    
    # @yield [Array] pairs
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :take_pairs
        def take_pairs(*args)
            args.each do |i|
                yield [i, self[i]]
            end
        end
    end
    
    ##
    # Returns items from +Hash+ under given keys in required order. 
    # Doesn't keep default values settings. Includes none-existing 
    # values.
    #
    # @example
    #   hash = {:a => 1, :b => 2, :c => 3}
    #   hash.take_items(:a, :c, :d)       # will return {:a => 1, :c => 3, :d => nil}
    #    
    # @param [*Object] keys
    # @return [Hash] new hash
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :take_items
        def take_items(*args)
            result = { }
            self.take_pairs(*args) do |key, value|
                result[key] = value
            end
            
            return result
        end
    end
   
    ##
    # Returns values from +Hash+ under given keys in required order 
    # including none-existing values.
    #
    # @example
    #   hash = {:a => 1, :b => 2, :c => 3}
    #   hash.take_values(:a, :c, :d)            # will return [1, 3, nil]
    #    
    # @param [*Object] keys
    # @return [Array] array of values
    # @since 0.15.0
    #
    
    if not self.__hash_utils_instance_respond_to? :take_values
        def take_values(*args)
            result = [ ]
            self.take_pairs(*args) do |key, value|
                result << value
            end
            
            return result
        end
    end
    
    ##
    # Returns sum of items in the hash. If other than numeric type found,
    # it will be normally conacenated if it's possible. 
    #
    # @example
    #   hash = {:a => 1, :b => 2, :c => 3}
    #   hash.sum                            # will return 6
    #   hash = {:a => "a", :b => "b", :c => "c"}
    #   hash.sum                            # will return "abc"
    #
    # @return [Integer, Object] result of summing
    # @see Array#sum
    # @since 0.16.0
    #
    
    if not self.__hash_utils_instance_respond_to? :sum
        def sum
            self.values.sum
        end
    end
    
    ##
    # Returns average of items in the hash. Numeric types are expected,
    # but content of the hash isn't checked.
    #
    # @example
    #   hash = {:a => 1, :b => 2, :c => 3}
    #   hash.avg                           # will return 2
    #
    # @return [Numeric] result of averaging
    # @since 0.16.0
    #
    
    if not self.__hash_utils_instance_respond_to? :avg 
        def avg
            self.values.avg
        end
    end
    
    if not self.__hash_utils_instance_respond_to? :average
        alias :average :avg
    end

    ##
    # Indicates, object is +Hash+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    if not self.__hash_utils_instance_respond_to? :hash?     
        def hash?
            true
        end
    end
        
end
