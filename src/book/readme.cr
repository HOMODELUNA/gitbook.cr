module Gitbook
  class Book
    class Readme
      @file :           Path
      @title :          String 
      @description :    String 

      getter :file , :title , :description

      def initialize(@file,@title = "",@description = "")
      end
    end
  end
end