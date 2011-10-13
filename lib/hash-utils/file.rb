# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "ruby-version"

##
# File extension.
# @since 0.11.0
#

class File

    
    if Ruby::Version < [1, 9, 3]
      
        ##
        # Writes data to file and closes it in single call.
        # 
        # @note Data were written in binary mode since +0.11.1+, 
        #   but since +0.19.0+, they are written non-binary again.
        #   Binary writing is implemented via {File#binwrite}. 
        # @note Since Ruby 1.9.3 replaced by STL native version.
        #
        # @param [String] filepath path to file
        # @param [String] data data for write
        # @return [Integer] length of really written data
        # @since 0.11.0
        #
        
        def self.write(filepath, data = "")
            len = nil
            File.open(filepath, "w") do |io|
                len = io.write(data)
            end
            return len
        end
    end

    if Ruby::Version < [1, 9, 3]
      
        ##
        # Writes binary data to file and closes it 
        # in single call.
        #
        # @note Since Ruby 1.9.3 replaced by STL native version.
        #
        # @param [String] filepath path to file
        # @param [String] data data for write
        # @return [Integer] length of really written data
        # @since 0.19.0
        #
            
        def self.binwrite(filepath, data = "")
            len = nil
            File.open(filepath, "wb") do |io|
                len = io.write(data)
            end
            return len
        end
    end
    
    ##
    # Creates file with zero size and closes it. (In fact, +touch+ is
    # usually used for it.)
    #
    # @param [String] file filepath path for create
    # @since 0.11.0
    #
    
    def self.touch(filepath)
        File.open(filepath, "wb").close()
    end
    
end

