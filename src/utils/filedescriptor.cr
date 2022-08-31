module Gitbook
  class FileDescriptor
    # Path of the file, relative to the FS
    @path :       String

    # Time when file data last modified
    @mtime :      Time

    getter :path , :mtime

    def initialize(@path,@mtime)
    end
    #Create a file with only a path
    #TODO:
    def from_filepath(path : String)
      
    end
    #Create a file from stats informations
    #TODO:
    def from_stat()
    end
    def exists? () : Bool
      File.exists?(@path)
    end
    #Return type of file ('markdown' or 'asciidoc')
    def type(): String?
      if a = self.parser
        a.name
      else 
        nil
      end
    end
    #Return extension of this file (lowercased)
    def ext() : String
      FIle.extname(@path)
    end
    # Return parser for this file
    #TODO:  return parsers.getByExt(this.getExtension());
    def parser()
      # return parsers.getByExt(this.getExtension());
    end
# File.prototype.getType = function() {
#   var parser = this.getParser();
#   if (parser) {
#       return parser.getName();
#   } else {
#       return undefined;
#   }
# };

# /**
#   Create a file from stats informations

#   @param {String} filepath
#   @param {Object|fs.Stats} stat
#   @return {File}
# */
# File.createFromStat = function createFromStat(filepath, stat) {
#   return new File({
#       path: filepath,
#       mtime: stat.mtime
#   });
# };

# /**
#   Create a file with only a path

#   @param {String} filepath
#   @return {File}
# */
# File.createWithFilepath = function createWithFilepath(filepath) {
#   return new File({
#       path: filepath
#   });
# };



  end
end