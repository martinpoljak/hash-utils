# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# Module extension.
#

class Module

    ##
    # Returns submodule or subclass recursively. It's approximately 
    # 3x faster than +Kernel#eval+.
    # 
    # @example
    #   Kernel.get_module("Zlib::Inflate")
    #
    # @param [String] full class or module name
    # @return [Module] required module
    # @since 0.13.0
    #
    
    def get_module(name)
        names = name.split("::")
        mod = self
        
        while not names.empty?
            name = names.shift
            mod = mod.const_get(name)
        end
        
        return mod
    end

end
