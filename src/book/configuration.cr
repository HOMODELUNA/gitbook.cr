require "../utils/filedescriptor"
require "../utils/reduced_object"
require "json"
module Gitbook
  class Book
    # [official](https://github.com/GitbookIO/gitbook/blob/master/docs/config.md)
    #GitBook allows you to customize your book using a flexible configuration. 
    #These options are specified in a book.json file. 
    #For authors unfamiliar with the JSON syntax, you can validate the syntax using tools such as JSONlint.
    class Configuration

      @file : Path?
      @values : ::JSON::Any
      def initialize(@file,@values)
        unless @values.is_a?(Hash)
          raise "the values must be a map!"
        end
      end

      def self.from_values(values)
        Configuration.new(nil,values)
      end
      property :file ,:values
      def to_reduced_version
        if @values.is_a?(Hash(String,JSON::Type))
          return reduced_object(configDefault, @values);
        else
          raise "your value isn't a map!"
        end
      end

      # Convert a keyPath to an array of keys
      def self.key_to_path(key : String | Enumerable(String) ) : Array(String)
        case key
        when String
          key.split('.')
        else
          key.to_a
        end
      end

      # Render config as text
      #TODO: Stringify
      def to_text() : String
        #return JSON.stringify(this.toReducedVersion().toJS(), null, 4);
        ""
      end

      def [](key)
        @values[key]
      end
      def []=(key,value)
        @values[key] = value
      end
    end
  end
end