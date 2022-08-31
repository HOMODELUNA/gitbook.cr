module Gitbook
  class Ignore
    DEFAULT_IGNORES = [
    # Skip Git stuff
    ".git/",

    # Skip OS X meta data
    ".DS_Store",

    # Skip stuff installed by plugins
    "node_modules",

    # Skip book outputs
    "_book",

    # Ignore files in the templates folder
    "_layouts"
    ]

    @pattern : String 
    def initialize(@pattern)
    end
  end
end