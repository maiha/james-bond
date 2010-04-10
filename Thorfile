class Benchmark < Thor
  class Activate
    Library = Struct.new(:name, :time, :error)
    class Library
      def activate
        time = Time.now
        require name
        self.time = Time.now - time
      rescue Exception => e
        self.error = e.to_s
      end
    end

    def initialize(*names)
      # normalize
      names = names.map{|i| i.sub(%r{-\d+(\.\d+)*$}, '')}
      names.delete 'rubygems'
      names.unshift 'rubygems'
      @libs = names.map{|name| Library.new(name)}
    end

    def execute
      activate
      dump
    end

    private
      def activate
        @libs.each(&:activate)
      end

      def colorize(text, ansi); "#{ansi}#{text}\e[0m"; end
      def green (text); colorize(text, "\e[32m"); end
      def red   (text); colorize(text, "\e[31m"); end
      def yellow(text); colorize(text, "\e[33m"); end
      def blue  (text); colorize(text, "\e[34m"); end

      def dump(output = $stdout)
        sum = @libs.inject(0){|v,l| v+l.time.to_f}
        @libs.each do |lib|
          if sum == 0
            per = yellow('[-----]')
          elsif lib.time.to_f == 0
            per = red('[-----]')
          else
            per = green('[%4.1f%%]' % (lib.time.to_f*100/sum))
          end

          error = lib.error ? red("[#{lib.error}]") : ''
          time = lib.time ? green("%.7f" % lib.time.to_f) : red("%7s" % '---------')
          output.puts "#{per} #{time} #{lib.name} #{error}"
        end
        output.puts yellow("[total] %.7f" % sum)
      end
  end

  desc "rubygems", "Benchmark for loading gems"
  def rubygems(*gems)
    Activate.new(*gems).execute
  end
end
