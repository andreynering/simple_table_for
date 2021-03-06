$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'simple_table_for/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'simple_table_for'
  s.version     = SimpleTableFor::VERSION
  s.authors     = ['Andrey Nering']
  s.email       = ['andrey.nering@gmail.com']
  s.homepage    = 'https://github.com/andreynering/simple_table_for'
  s.summary     = 'Simple Table For helper for creating HTML tables in Rails'
  s.description = 'Simple Table For helper for Rails let you generate HTML tables in a simple and clean way'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_development_dependency 'sqlite3'
  s.add_dependency 'rails', '>= 4.0.0'
end
