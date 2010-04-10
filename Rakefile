require 'rubygems'
require 'rake/gempackagetask'

GEM_NAME = "james-bond"
AUTHOR = "maiha"
EMAIL = "maiha@wota.jp"
HOMEPAGE = "http://github.com/maiha/james-bond"
SUMMARY = "James is a bond framework for web development"
GEM_VERSION = "0.0.1"

spec = Gem::Specification.new do |s|
  s.rubyforge_project = 'asakusarb'
  s.executables = []
  s.name = GEM_NAME
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "MIT-LICENSE"]
  s.summary = SUMMARY
  s.description = "James is a bond framework for web development that offers MVC framework and Ruby friendly method based actions to Sinatra. Yep, of course this is inspired by monk-glue, and implemented as a wrapper to it."
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.require_path = 'lib'
  s.add_dependency('sinatra', '>= 0.9.4')
  s.add_dependency('monk-glue', '>= 0.0.1')
  s.add_dependency('extlib', '>= 0.9.14')
  s.files = %w(MIT-LICENSE README Rakefile Thorfile) + Dir.glob("{lib,spec,gen}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Install the gem"
task :install do
  Merb::RakeHelper.install(GEM_NAME, :version => GEM_VERSION)
end

desc "Uninstall the gem"
task :uninstall do
  Merb::RakeHelper.uninstall(GEM_NAME, :version => GEM_VERSION)
end

desc "Create a gemspec file"
task :gemspec do
  File.open("#{GEM_NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

require 'spec/rake/spectask'
desc 'Default: run spec examples'
task :default => 'spec'
