# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'srm/version'

Gem::Specification.new do |spec|
  spec.name          = 'srm'
  spec.version       = Srm::VERSION
  spec.authors       = ["Matt Chun-Lum\n"]
  spec.email         = ['mchunlum@gmail.com']
  spec.summary       = 'Uncomplicated multiple repository management'
  spec.description   = 'Uncomplicated multiple repository management'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'thor'
  spec.add_dependency 'configatron'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop', '>= 0.32.1'
  spec.add_development_dependency 'overcommit', '>= 0.24.0'
end
