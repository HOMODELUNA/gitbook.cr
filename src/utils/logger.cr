module Gitbook
  module Utils
    class Logger
      enum Level
        DEBUG= 0
        INFO= 1
        WARN= 2
        ERROR= 3
        DISABLE= 10 

        # def color
        #   COLORS = {
        #     Levels::DEBUG=> color.purple,
        #     INFO=> color.cyan,
        #     WARN=> color.yellow,
        #     ERROR=> color.red
        #   }
        #   COLORS[self] ? || color.default
        # end
      end
      
      @minimun_level : Level = Level::DEBUG

      @write : String -> Void
      DefaultWriter = ->(msg : String){STDOUT.print(msg)}
      @lastChar : Char = '\n'
      def initialize(@write = DefaultWriter,@minimum_level = Level::INFO)
      end

      def write(msg)
        str = msg.to_s
        @lastchar = str[-1]
        @write.call(str)
      end

      def writeLn(msg)
        self.write( (msg||"") + '\n' )
      end

      def log(level,*args)
        return if (level < @minimum_level)

        levelKey = Level::ERROR
        msg = this.format.apply(this, args);

        if (this.lastChar == '\n') 
          # msg = COLORS.get(levelKey)(levelKey.toLowerCase()+':')+' '+msg;
        end
        return @write.call(msg);
      end

    end
  end
end