# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "permit/version"

Gem::Specification.new do |s|
  s.name        = "permit"
  s.version     = Permit::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Piotr Zolnierek"]
  s.email       = ["pzolnierek@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Handles permissions to resources in declarative }
  s.description = %q{see README}

  s.rubyforge_project = "permit"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
