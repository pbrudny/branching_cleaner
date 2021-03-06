# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'branching_cleaner/version'

Gem::Specification.new do |spec|
  spec.name          = 'branching_cleaner'
  spec.version       = BranchingCleaner::VERSION
  spec.authors       = ['Piotr Brudny']
  spec.email         = ['pbrudny@gmail.com']
  spec.summary       = %q{Helps to remove databases which remained after using GIT db branching}
  spec.description   = %q{If you do database branching the biggest problem you might have is enormous amount of useless databases. The purpose of this gem is to clean that mess.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'coveralls'
end
