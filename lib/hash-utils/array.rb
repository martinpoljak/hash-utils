# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

class Array

    ##
    # Checks, all values follow condition expressed in block.
    # Block must return Boolean.
    #
    # If it's empty, returns <tt>true</tt>.
    #
    
    def all?(&block)
        if self.empty?
            return true
        end
        
        self.each do |v|
            if block.call(v) == false
                return false
            end
        end
        
        return true
    end

    ##
    # Checks, at least one value follows condition expressed in 
    # block. Block must return Boolean.
    #
    
    def some?(&block)
        self.each do |v|
            if block.call(v) == true
                return true
            end
        end
        
        return false
    end

end
