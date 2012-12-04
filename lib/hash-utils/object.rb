# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "ruby-version"

##
# Object extension.
#

class Object
    
    @@__hash_utils_methods_index = { } 
    @@__hash_utils_object_index = [ ]
        
    private
    
    ##
    # Both indicates, instance of the class responds to some call
    # and indicates patched calls in Object
    #
    # @param [Symbol] call  a call name
    # @return [Boolean] +true+ it it is, +false+ otherwise
    # @since 2.0.0
    #

    def self.__hash_utils_object_respond_to?(call)\
        @@__hash_utils_object_index << call
        self.__hash_utils_instance_respond_to? call
    end
    
    
    public
        
    ##
    # Indicates, instance of the class responds to some call.
    #
    # @param [Symbol] call  a call name
    # @return [Boolean] +true+ it it is, +false+ otherwise
    # @private as it's intended for internal library use
    # @since 2.0.0
    #
    
    if not self.methods.include? :__hash_utils_instance_respond_to?
        def self.__hash_utils_instance_respond_to?(call)
            if not @@__hash_utils_methods_index.has_key? self
                instance_methods = self.instance_methods
              
                if Ruby::Version >= [1, 9]
                    require "set"
                    @@__hash_utils_methods_index[self] = Set::new(instance_methods)
                    
                    if self != Object
                        @@__hash_utils_methods_index[self] -= @@__hash_utils_object_index
                    end
                else
                    @@__hash_utils_methods_index[self] = { }
                    _col = @@__hash_utils_methods_index[self]
                    
                    instance_methods.each do |i|
                        _col[i] = true
                    end
                    
                    if self != Object
                        @@__hash_utils_object_index.each do |i|
                            _col.delete(i)
                        end
                    end
                end
            end
            
            @@__hash_utils_methods_index[self].include? call
        end
    else
        throw new Exception('__hash_utils_instance_respond_to? is already implemented. Hash Utils need this method for iternal defensive checking. Continuing is impossible.')
    end
    
    ##
    # Returns +true+ if object is an instance of the given classes. 
    #
    # @see #kind_of_any?
    # @param [Array] classes array of class objects
    # @return [Boolean] +true+ if it is, +false+ in otherwise
    # @since 0.16.0
    #
    
    if not __hash_utils_object_respond_to? :instance_of_any?
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
    
    if not __hash_utils_object_respond_to? :kind_of_any?
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
    end
    
    if not __hash_utils_object_respond_to? :is_a_any?
        alias :is_a_any? :kind_of_any?
    end

    ##
    # Indicates object is in some object which supports +#include?+.
    #
    # @param [Object] range container for analyzing
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.8.0
    #
    
    if not __hash_utils_object_respond_to? :in?
        def in?(range)
            range.include? self
        end
    end

    ##
    # Converts object to Boolean according to Ruby conversion rules.
    #
    # @return [Boolean] +true+ or +false+
    # @since 0.7.0
    #
    
    if not __hash_utils_object_respond_to? :to_b
        def to_b
            !!self
        end
    end
    
    ##
    # Multiplies object by +#dup+ n-times.
    #
    # @param [Integer] count required number of copies
    # @return [Array] array with object copies
    # @since 0.12.0
    #
    
    if not __hash_utils_object_respond_to? :**
        def **(count)
            result = [ ]
            count.times { result << self.dup }
            return result
        end
    end
    
    ##
    # Indicates, object is IO, so +IO+ or +StringIO+ class.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.14.0
    #
    
    if not __hash_utils_object_respond_to? :io?
        def io?
            false
        end
    end
    
    ##
    # Indicates, object is pure +true+, so +TrueClass+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.15.0
    #
    
    if not __hash_utils_object_respond_to? :true?
        def true?
            self.kind_of? TrueClass
        end
    end
    
    ##
    # Indicates, object is pure +false+, so +FalseClass+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.15.0
    #
    
    if not __hash_utils_object_respond_to? :false?
        def false?
            self.kind_of? FalseClass
        end
    end
    
    ##
    # Indicates, object is +String+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    if not __hash_utils_object_respond_to? :string?
        def string?
            self.kind_of? String
        end
    end
    
    ##
    # Indicates, object is +Symbol+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    if not __hash_utils_object_respond_to? :symbol?
        def symbol?
            self.kind_of? Symbol
        end
    end
    
    ##
    # Indicates, object is +Proc+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.18.0
    #
    
    if not __hash_utils_object_respond_to? :proc?
        def proc?
            self.kind_of? Proc
        end
    end
    
    ##
    # Indicates, object is +Numeric+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    if not __hash_utils_object_respond_to? :number?
        def number?
            self.kind_of? Numeric
        end
    end
    
    ##
    # Indicates, object is boolean.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    if not __hash_utils_object_respond_to? :boolean?
        def boolean?
            self.true? or self.false?
        end
    end
    
    ##
    # Indicates, object is +Array+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    if not __hash_utils_object_respond_to? :array?
        def array?
            self.kind_of? Array
        end
    end
    
    ##
    # Indicates, object is +Hash+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 0.17.0
    #
    
    if not __hash_utils_object_respond_to? :hash?
        def hash?
            self.kind_of? Hash
        end
    end

    ##
    # Indicates, object is implementing +Enumerable+.
    #
    # @return [Boolean] +true+ if yes, +false+ in otherwise
    # @since 2.0.1
    #
    
    if not __hash_utils_object_respond_to? :enumerable?
        def enumerable?
            self.kind_of? Enumerable
        end
    end
    
    ##
    # Converts object to +Symbol+. In fact, converts it to +String+
    # and subsequently to +Symbol+ only.
    #
    # @return [Symbol] symbol representation of the object
    # @since 1.1.0
    # @since 2.1.0 is +#to_sym+ deprecated in favor to +#to_symbol+
    #
    
    if not __hash_utils_object_respond_to? :to_symbol
        def to_symbol
            self.to_s.to_sym
        end
    end

    if not __hash_utils_object_respond_to? :to_sym
        alias :to_sym :to_symbol
    end
end
