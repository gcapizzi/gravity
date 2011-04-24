# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gravity/version"

Gem::Specification.new do |s|
  s.name        = "gravity"
  s.version     = Gravity::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Giuseppe Capizzi"]
  s.email       = ["g.capizzi@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A simple gravatar plugin for Rails.}
  s.description = %q{A simple gravatar plugin for Rails.}

  s.rubyforge_project = "gravity"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency("json")
end
