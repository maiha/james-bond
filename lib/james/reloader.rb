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
        updated_files = []
        @timestamps ||= {}
        routing_changed = false

        files.each do |file|
          begin
            now = File.mtime(file).to_i
            old = @timestamps[file].to_i
            routing = file =~ %r{(^|/)app/routes/}o
            if routing or now > old
              updated_files << file
              routing_changed = true if routing and now > old
              James.say_status(:updated, file) if old > 0
            end
            @timestamps[file] = now
          rescue Exception
            updated_files << file
          end
        end

        if routing_changed
          Main.reset!
        end

        updated_files.each do |file|
          next if !routing_changed and file =~ %r{(^|/)app/routes/}o
          load file
        end
      end

      def files
        array = []
        James.libs.each do |dir, reload|
          array << dir if File.exist?(dir.sub(/(\.rb)?$/, '') + '.rb')
          array.concat(Dir.glob("#{dir}/**/*.rb").sort) if File.directory?(dir)
        end
        return array
      end
    end
  end
end
