# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "croaker/version"

Gem::Specification.new do |spec|
  spec.name          = "croaker"
  spec.version       = Croaker::VERSION
  spec.authors       = ["Daniel J. Pritchett", "Benjamin Robin"]
  spec.email         = ["dpritchett@gmail.com", "ben@clearfunction.com"]

  spec.summary       = %q{Swallow API exceptions responsibly}
  spec.description   = %q{Swallow API exceptions responsibly}
  spec.homepage      = "https://github.com/clearfunction/croaker"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
