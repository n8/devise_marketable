# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise_marketable/version'

Gem::Specification.new do |spec|
  spec.name          = "devise_marketable"
  spec.version       = DeviseMarketable::VERSION
  spec.authors       = ["nate"]
  spec.email         = ["nate@cityposh.com"]
  spec.description   = %q{A simple way to have Devise capture important marketing data.}
  spec.summary       = %q{A simple way to have Devise capture important marketing data.}
  spec.homepage      = "http://ninjasandrobots.com/marketable-for-devise"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "devise"
end
