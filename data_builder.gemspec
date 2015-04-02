$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "data_builder/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "data_builder"
  s.version     = DataBuilder::VERSION
  s.authors     = ["Andrey Yakovlev"]
  s.email       = ["sigra.yandex@gmail.com"]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["lib/**/*", "Rakefile"]

  s.require_paths = ['lib']

  s.add_dependency "ffaker"
end
