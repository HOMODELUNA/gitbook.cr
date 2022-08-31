module Gitbook
  class Book
    class Language
      @title : String
      @path : String
      getter :title ,:path
      def initialize(@title,@path)
      end
      #TODO: path
      def id
        # path.basename(this.getPath());
      end
    end

  end
end

module Gitbook
  class Book
    # from [official](https://github.com/GitbookIO/gitbook/blob/master/docs/languages.md)
    #GitBook supports building books written in multiple languages. Each language should be a sub-directory following the normal GitBook format, and a file named LANGS.md should be present at the root of the repository with the following format:
    #```markdown
    ## Languages
    #
    #* [English](en/)
    #* [French](fr/)
    #* [Español](es/)
    #```
    ###Configuration for each language
    #When a language book (ex: en) has a `book.json`, its configuration will extend the main configuration.
    #
    #The only exception is plugins, plugins are specified globally, and language specific plugins cannot be specified.
    class Languages
      @file : FileDescriptor
      @list = [] of {String,Language}

      getter :file , :list

      def initialize(@file,@list)
      end

      def self.from_list(file : File , langs : Enumerable({String,String}))
        list = langs.map{|title,path| Language.new(title,path)}
        Languages.new(file,list)
      end

      def default_language
        @list[0] || raise "empty language list havs no default laguage"
      end

      def [](lang : String) : Language 
        if res = list.find(nil){|k,v|str == lang}
          res[1]
        else
          raise "no such language \"#{lang}\" in #{self}"
        end
      end

      def size
        @list.size
      end
    end
  end
end
