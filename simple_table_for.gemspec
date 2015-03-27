$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_table_for/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_table_for"
  s.version     = SimpleTableFor::VERSION
  s.authors     = ["Andrey Nering"]
  s.email       = ["andrey.nering@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SimpleTableFor."
  s.description = "TODO: Description of SimpleTableFor."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
