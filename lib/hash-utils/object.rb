# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# Object extension.
#

class Object
  
    ##
    # Returns +true+ if object is an instance of the given classes. 
    #
    # @see #kind_of_any?
    # @param [Array] classes array of class objects
    # @return [Boolean] +true+ if it is, +false+ in otherwise
    # @since 0.16.0
    #
    
    def instance_of_any?(*classes)
        if classes.first.array?
            classes = classes.first
        end
        
        classes.each do |cls|
            if self.instance_of? cls
                return true
            end
        end
        
        return false
    end

    ##
    # Returns +true+ if one of classes are the class of object, 
    # or if one of classes are one of the superclasses of object or 
    # modules included in object.
    #
    # @param [Array] classes array of class objects
    # @return [Boolean] +true+ if it is, +false+ in otherwise
    # @since 0.16.0
    #
    
    def kind_of_any?(*classes)
        if classes.first.array?
            classes = classes.first
        end
        
        classes.each do |cls|
            if self.kind_of? cls
                return true
            end
        end
        
        return false
    end
    
    alias :"is_a_any?" :"kind_of_any?"

    ##
    # Indicates object is in some object which supports +#include?+.
    #
    # @param [Object] range container for analyzing
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.8.0
    #
    
    def in?(range)
        range.include? self
    end

    ##
    # Converts object to Boolean according to Ruby conversion rules.
    #
    # @return [Boolean] +true+ or +false+
    # @since 0.7.0
    #
    
    def to_b
        !!self
    end
    
    ##
    # Multiplies object by +#dup+ n-times.
    #
    # @param [Integer] count required number of copies
    # @return [Array] array with object copies
    # @since 0.12.0
    #
    
    def **(count)
        result = [ ]
        count.times { result << self.dup }
        return result
    end
    
    ##
    # Indicates, object is IO, so +IO+ or +StringIO+ class.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.14.0
    #
    
    def io?
        false
    end
    
    ##
    # Indicates, object is pure +true+, so +TrueClass+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.15.0
    #
    
    def true?
        self.kind_of? TrueClass
    end
    
    ##
    # Indicates, object is pure +false+, so +FalseClass+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.15.0
    #
    
    def false?
        self.kind_of? FalseClass
    end
    
    ##
    # Indicates, object is +String+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    def string?
        self.kind_of? String
    end
    
    ##
    # Indicates, object is +Symbol+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    def symbol?
        self.kind_of? Symbol
    end
    
    ##
    # Indicates, object is +Proc+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.18.0
    #
    
    def proc?
        self.kind_of? Proc
    end
    
    ##
    # Indicates, object is +Numeric+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    def number?
        self.kind_of? Numeric
    end
    
    ##
    # Indicates, object is boolean.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    def boolean?
        self.true? or self.false?
    end
    
    ##
    # Indicates, object is +Array+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    def array?
        self.kind_of? Array
    end
    
    ##
    # Indicates, object is +Hash+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    def hash?
        self.kind_of? Hash
    end
        
end
