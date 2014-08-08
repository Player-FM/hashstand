# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hashstand/version'

Gem::Specification.new do |spec|
  spec.name          = "hashstand"
  spec.version       = Hashstand::VERSION
  spec.authors       = ["Mahemoff"]
  spec.email         = ["michael@mahemoff.com"]
  spec.summary       = %q{Tools for hashing, generating short codes, etc.}
  spec.description   = %q{Tools for hashing, generating short codes, etc.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'hashie'
  spec.add_dependency 'base62'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 4.7.3"
end
