# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{james-bond}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["maiha"]
  s.date = %q{2010-04-11}
  s.description = %q{James is a bond framework for web development that offers MVC framework and Ruby friendly method based actions to Sinatra. Yep, of course this is inspired by monk-glue, and implemented as a wrapper to it.}
  s.email = %q{maiha@wota.jp}
  s.extra_rdoc_files = ["README", "MIT-LICENSE"]
  s.files = ["MIT-LICENSE", "README", "Rakefile", "Thorfile", "lib/james-bond.rb", "lib/james", "lib/james/bond.rb", "lib/james/reloader.rb", "lib/james/bond", "lib/james/bond/settings.rb", "lib/james/config.rb", "spec/provide_helper.rb", "spec/its_helper.rb", "spec/spec_helper.rb", "gen/templates", "gen/templates/init.rb", "gen/templates/Thorfile", "gen/templates/config.ru", "gen/templates/dependencies"]
  s.homepage = %q{http://github.com/maiha/james-bond}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{asakusarb}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{James is a bond framework for web development}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, [">= 0.9.4"])
      s.add_runtime_dependency(%q<monk-glue>, [">= 0.0.1"])
      s.add_runtime_dependency(%q<extlib>, [">= 0.9.14"])
    else
      s.add_dependency(%q<sinatra>, [">= 0.9.4"])
      s.add_dependency(%q<monk-glue>, [">= 0.0.1"])
      s.add_dependency(%q<extlib>, [">= 0.9.14"])
    end
  else
    s.add_dependency(%q<sinatra>, [">= 0.9.4"])
    s.add_dependency(%q<monk-glue>, [">= 0.0.1"])
    s.add_dependency(%q<extlib>, [">= 0.9.14"])
  end
end
