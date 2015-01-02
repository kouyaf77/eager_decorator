# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "eager_decorator/version"

Gem::Specification.new do |spec|
  spec.name          = "eager_decorator"
  spec.version       = EagerDecorator::VERSION
  spec.authors       = ["KoyaFukuda"]
  spec.email         = ["kouyaf77@gmail.com"]
  spec.summary       = %q{A simple Decorator for Rails}
  spec.description   = %q{A simple Decorator for Rails}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
