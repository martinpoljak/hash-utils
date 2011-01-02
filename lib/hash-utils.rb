# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

class Hash

    ##
    # Returns a copy of <tt>self</tt> with all <tt>nil</tt> 
    # elements removed.
    #

    def compact
        self.reject { |k, v| v.nil? }
    end
    
    ##
    # Removes <tt>nil</tt> elements from the hash. Returns <tt>nil</tt> 
    # if no changes were made, otherwise returns <tt>self</self>.
    #
    
    def compact!
        self.reject! { |k, v| v.nil? }
    end
    
    ##
    # Returns a new hash with the results of running block once for 
    # every pair in <tt>self</tt>.
    #
    
    def map_pairs(&block)
        new = Hash::new(&self.default_proc)
        new.default = self.default
        
        self.each_pair do |k, v|
            new_k, new_v = block.call(k, v)
            new[new_k] = new_v
        end
        
        return new
    end
    
    alias :collect_pairs :map_pairs
    
    ##
    # Emulates #map_pairs on place. In fact, replaces old hash by 
    # new one.
    #
    
    def map_pairs!(&block)
        self.replace(self.map_pairs(&block))
    end
    
    alias :"collect_pairs!" :"map_pairs!"
    
    ##
    # Returns a new hash with the results of running block once for 
    # every key in <tt>self</tt>.
    #
    
    def map_keys(&block)
        self.map_pairs do |k, v|
            [block.call(k), v]
        end
    end
    
    alias :collect_keys :map_keys
    
    ##
    # Emulates #map_keys on place. In fact, replaces old hash by 
    # new one.
    #
    
    def map_keys!(&block)
        self.replace(self.map_keys(&block))
    end
    
    alias :"collect_keys!" :"map_keys!"
    
    ##
    # Converts all keys to symbols.
    #
    
    def keys_to_sym
        self.map_keys { |k| k.to_sym }
    end
    
    ##
    # Emulates #keys_to_sym on place. In fact, replaces old hash by 
    # new one.
    #
    
    def keys_to_sym!
        self.replace(self.keys_to_sym)
    end
end
