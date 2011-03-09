# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# File extension.
# @since 0.11.0
#

class File

    ##
    # Writes data to file and closes it in single call. Data are written
    # in binary mode since +0.11.1+.
    #
    # @param [String] filepath path to file
    # @param [String] data data for write
    # @return [Integer] length of really written data
    # @since 0.11.0
    #
    
    def self.write(filepath, data = "")
        len = nil
        File.open(filepath, "wb") do |io|
            len = io.write(data)
        end
        return len
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

