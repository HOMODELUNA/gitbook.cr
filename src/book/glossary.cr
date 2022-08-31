
require "../utils/filedescriptor"
module Gitbook
  class Book
    # Allows you to specify terms and their respective definitions to be displayed as annotations. Based on those terms, GitBook will automatically build an index and highlight those terms in pages.
    #
    #The GLOSSARY.md format is a list of h2 headings, along with a description paragraph:
    #```markdown
    ### Term
    #Definition for this term
    #
    ### Another term
    #With it's definition, this can contain bold text
    #and all other kinds of inline markup ...
    class Glossary

      class Entry
        @name : String
        @description : String
        getter :name , :description
        def initialize(@name ,@description)
        end
        def id () : String
          return  Entry.name_to_id(@name)
        end
        # TODO: slugid
        def self.name_to_id(name : String) : String
        end
      end
      @file : FileDescriptor
      @entries = {} of String => Entry
      getter :file , :entries

      def initialize(@file,@entries)
      end

      def from_entries(file : FileDescriptor, entries : Enumerable(Entry))
        id_entries = entries.to_h{|en|{Entry.name_to_id(en),en}}
        Glossary.new(file,id_entries)
      end


      def [](id : String)
        @entries[name]
      end
      def []=(id : String,entry : Entry)
        @entries[name]=entry
      end

      def get_by_name(name : String)
        @entries[Entry.name_to_id(name)]
      end
      def set_by_name(name : String,entry : Entry)
        @entries[Entry.name_to_id(name)] = entry
      end
      # Render glossary as text
      # TODO: parser
      def to_text
      end
    end
  end
end

# Glossary.prototype.toText = function(parser) {
#     var file = this.getFile();
#     var entries = this.getEntries();

#     parser = parser? parsers.getByExt(parser) : file.getParser();

#     if (!parser) {
#         throw error.FileNotParsableError({
#             filename: file.getPath()
#         });
#     }

#     return parser.renderGlossary(entries.toJS());
# };


