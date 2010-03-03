require 'monk/glue/reloader'

module James
  class Reloader < Monk::Glue::Reloader
    def reload!
      self.class.reload!
    end

    def files
      self.class.files
    end

    class << self
      def reload!
        srcs = files
        srcs.each do |file|
          $LOADED_FEATURES.delete(file)
        end

        Main.reset!

        srcs.each do |file|
          p [:require, file]
          require file
        end
      end

      def files
        array = []
        James.libs.each do |dir, reload|
          dir = Pathname(dir[0] == ?/ ? dir : James.root + dir)
          array << dir.to_s if File.exist?(dir.to_s.sub(/(\.rb)?$/, '') + '.rb')
          array.concat(Dir.glob("#{dir}/**/*.rb").sort) if dir.directory?
        end
        return array
      end
    end
  end
end
