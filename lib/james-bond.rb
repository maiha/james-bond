ROOT_DIR = Dir.pwd unless defined?(ROOT_DIR)

require "monk/glue"
require "pathname"
require "dsl_accessor"
require "extlib"
require "extlib/dictionary"
require "thread"

module James
  dsl_accessor :root, Pathname(Dir.pwd)
  dsl_accessor :init, root + "init.rb"
  dsl_accessor :libs, proc { Dictionary.new }

  def run(file)
    Main.app_file = file
    Reloader.reload!
    Main.run! if Main.run?
  end

  def config(&block)
    @config ||= Config.new
    @config.instance_eval(&block) if block
    return @config
  end

  extend self
end

require File.dirname(__FILE__) + "/james/config"
require File.dirname(__FILE__) + "/james/reloader"
require File.dirname(__FILE__) + "/james/bond"

class Main < James::Bond
end

James.config do
  require "lib"
  require "app", :reload
  require "config/local", :reload

  port ENV["RACK_PORT"]
end
