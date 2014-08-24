# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'RedditApi/version'

Gem::Specification.new do |spec|
  spec.name          = "RedditApi"
  spec.version       = RedditApi::VERSION
  spec.authors       = ["Anurag Mohanty"]
  spec.email         = ["tevren@gmail.com"]
  spec.summary       = %q{Ruby wrapper around the reddit api using oauth}
  spec.description   = %q{Ruby wrapper around the reddit api using oauth}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "faraday"
end
