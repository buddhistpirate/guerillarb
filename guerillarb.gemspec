# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guerillarb/version'

Gem::Specification.new do |spec|
  spec.name          = "guerillarb"
  spec.version       = Guerillarb::VERSION
  spec.authors       = ["buddhistpirate"]
  spec.email         = ["buddhistpirate@chubtoad.com"]
  spec.description   = %q{Random Document body generator}
  spec.summary       = %q{Random Document body generator}
  spec.homepage      = "https://github.com/buddhistpirate/guerillarb"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'multi_json', '~> 1.0'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
