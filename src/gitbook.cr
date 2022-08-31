require "option_parser"
# TODO: Write documentation for `Gitbook`
module Gitbook
  VERSION = "0.1.0"

  # TODO: Put your code here
end

# OptionParser.parse! do |parser|
#   parser.banner = "Usage: salute [arguments]"
#   parser.on("-u", "--upcase", "Upcases the salute") { upcase = true }
#   parser.on("-t NAME", "--to=NAME", "Specifies the name to salute") { |name| destination = name }
#   parser.on("-h", "--help", "Show this help") { puts parser }
# end

cmdparser = Optionparser.new do |parser|
  parser.banner = "Usage: gitbook [didrectory] -e [generator]"

end

