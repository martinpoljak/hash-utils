# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "hash-utils/object"

##
# +Gem+ extension.
# @since 0.17.1
#

module Gem

    ##
    # Indicates, gem is available.
    #
    # @param [String] name gem name
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.1
    #
    
    if not self.respond_to? :available? 
        def self.available?(name)
            begin
                return Gem::Specification::find_by_name(name.to_s).to_b
            rescue Gem::LoadError
                return false
            end
        end
    end

    ##
    # Requires available gem. If file isn't set, requires file with same
    # name as gem.
    #
    # @param [String] name gem name
    # @param [String] file file name
    # @return [Boolean] +true+ if it's available, +false+ in otherwise
    # @since 0.17.1
    #
    
    if not self.respond_to? :require_available
        def self.require_available(name, file = nil)
            if self.available? name
                require file.nil? ? name : file
                true
            else
                false
            end
        end
    end
    
end
