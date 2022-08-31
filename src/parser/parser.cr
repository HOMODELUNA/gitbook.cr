require "../book/summary"
require "../book/glossary"
module Gitbook

  class Parser
    # most book files (maybe except book.json) is in the root directory
    # a parser goes into the directory, search there files,and forms a book
    # if files are not complete, the parser should raise some error 
    # it should go though this routine

    def self.parse_book(root : Dir) : Book
      rootpath = root.path()
      ignores = self.parse_ignore(rootpath/"")
      readme_md = self.parse_readme(rootpath/"README.md")
      config = self.parse_config(rootpath/"book.json")
      summary_md = self.parse_summary(rootpath/"SUMMARY.md")
      glossary_md = self.parse_glossary(rootpath/"GLOSSARY.md")
      langs =self.parse_langs(rootpath / "LANG.md")

      if langs
        #self.parse_multilingual_book();
      else
        #book = self.parse_book_content(rootpath)
      end
    end
  end
  def self.parse_readme(readme_path) : Markd::Node
    Markd::Parser.parse(File.read(readme_path))
  end
  #read summary files from a path
  #TODO:Insert readme as first entry if not in SUMMARY.md
  def parse_summary(summary_path : Path,readme : Markd::Node) : Book::Summary?
    unless File.exists?(summary_path)
      return nil
    end
    return Book::Summary.new(Markd.parse(File.read(summary_path)))
  end

  #read config from `book.json`
  def parse_config(config_path : Path) : JSON::Type
    return nil unless File.exists?(config_path)
    return File.open(config_path) do |config_file|
      JSON.parse(config_file)  
    end
  end
  # parse `GLOSSARY.md` and return a `Glossary`
  def parse_glossary(glossary_path : Path) : Glossary?
    return nil unless File.exists?(glossary_path)
    
  end
  # a LANG.md file should look like this:
  #```markdown
  ## Languages
  #
  #* [English](en/)
  #* [French](fr/)
  #* [Español](es/)
  #```
  def parse_langs(langs_dir : Path) : Hash(String,String)? 
    return nil unless File.exists?(langs_dir)
  end

  #GitBook will read the `.gitignore`, `.bookignore` and `.ignore` files to get a list of files and folders to skip. The format inside those files, follows the same convention as .gitignore:
  #```plaintext
  ## This is a comment
  #
  ## Ignore the file test.md
  #test.md
  #
  ## Ignore everything in the directory "bin"
  #bin/*
  #```
  def self.parse_ignore(root : Path) : Array(Ignore)
    res = [] of Ignore
    [".gitignore",".bookignore","ignore"].each do |ignore|
      if File.exists?(root/ignore)
        res << self.parse_ignore_single_file(root/ignore)
      end
    end
  end

  def self.parse_multilingual_book() : Book
  end

  def self.parse_book_content() : Book
  end

  private def self.parse_ignore_single_file(ignore_file : Path) : Array(Ignore) 
    File.read_lines(ignore_file)
      .map &.strip
      .reject{|str| str.empty? || str[0]=='#'}
      .map{|str|Ignore.new(str)}
  end
  # Promise(book)
  # .then(parseIgnore)
  # .then(parseConfig)
  # .then(parseLanguages)
  # .then(function(resultBook) {
  #     if (resultBook.isMultilingual()) {
  #         return parseMultilingualBook(resultBook);
  #     } else {
  #         return parseBookContent(resultBook);
  #     }
  # })

  # class Parser

  #   @name :           String()

  #   # List of extensions that can be processed using this parser
  #   @extensions = [] of String
  #   getter :name , :extensions
  #   # Parsing functions
  #   readme:         Function(),
  #   langs:          Function(),
  #   summary:        Function(),
  #   glossary:       Function(),
  #   page:           Function(),
  #   inline:         Function()

  #   def parse_glossary
  #   end
  #   def prepare_page
  #   end
  #   def parse_page
  #   end
  #   def parse_inline
  #   end
  #   def parse_languages
  #   end
  #   def render_languages
  #   end
  #   def render_summary
  #   end
  #   def reaner_glossary
  #   end
  #   def match_extension?(ext : String) : Bool
  #     @extensions.includes?(ext)
  #   end 
  # end
end