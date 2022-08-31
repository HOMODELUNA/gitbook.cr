require "../utils/logger"
require "./readme"
require "./language"
require "./configuration"
module Gitbook
  # according to the [official document](https://github.com/GitbookIO/gitbook/blob/master/docs/structure.md)
  # a book is just a simple directory structure, with some file critical:

  #- book.json:	Stores [configuration](https://github.com/GitbookIO/gitbook/blob/master/docs/config.md) data (optional)
  #- README.md:	Preface / Introduction for your book (required)
  #- SUMMARY.md:	Table of Contents (See [Pages]((https://github.com/GitbookIO/gitbook/blob/master/docs/pages.md))) (optional)
  #- GLOSSARY.md:	Lexicon / List of terms to annotate (See [Glossary](https://github.com/GitbookIO/gitbook/blob/master/docs/lexicon.md)) (optional)
  class Book
    # Logger for output message
    #@logger = Utils::Logger.new

    # Stores configuration data (optional)
    @config = JSON::Any
    # Preface / Introduction for your book (required)
    @readme : Readme
    # Table of Contents (See Pages) (optional)
    @summary = 0
    # Lexicon / List of terms to annotate (See Glossary) (optional)
    @glossary : Glossary?
    
    @languages = Languages.new
    # ID of the language for language books
    @language : String = ""

    # List of children, if multilingual (String -> Book)
    @books = {} of String => Book
    def initialize(@readme)
    end
  end
end
