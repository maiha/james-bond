$KCODE = 'u'

require "rubygems"

begin
  require "vendor/dependencies/lib/dependencies"
rescue LoadError
  require "dependencies"
end

#ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

require '/git/plugins/james-bond/lib/james-bond'

James.config do
  # Specify files to load, and give :reload for reloading in deveopment.
  # When a directory is given, sub directory is automatically loaded.
  # In default, following code is internally defined.
  #
  # require "lib"
  # require "app", :reload
  # require "config/local", :reload
end

James.run(__FILE__)
