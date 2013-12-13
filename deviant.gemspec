# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deviant/version'

Gem::Specification.new do |spec|
  spec.name          = "deviant"
  spec.version       = Deviant::VERSION
  spec.authors       = ["Jonathan Schatz"]
  spec.email         = ["jon@divisionbyzero.com"]
  spec.summary       = %q{Deviant provides effecient statistical analysis of data streams. }
  spec.description   = %q{Deviant is gem that allows you to quickly and efficiently compute statistical functions from streaming data without storing the entire set in memory, making it ideal for long running jobs dealing with millions of values. Deviant objects can be combined without loss of data so jobs can be parallelized as well.}
  spec.homepage      = "http://github.com/modosc/deviant"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.3"
  spec.add_development_dependency "rake"
end
