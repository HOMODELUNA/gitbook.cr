module Gitbook
  class Book
    class Summary
      @text = Markd::Node
      def initialize(@text)
      end
      
    end
  end
end