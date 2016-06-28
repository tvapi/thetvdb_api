# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "thetvdb_api/version"

Gem::Specification.new do |spec|
  spec.name          = "thetvdb_api"
  spec.version       = ThetvdbApi::VERSION
  spec.authors       = ["Krzysztof Wawer"]
  spec.email         = ["krzysztof.wawer@gmail.com"]
  spec.description   = %q{Ruby client for accessing TV shows information from the thetvdb.com API}
  spec.summary       = %q{Ruby client for thetvdb.com API}
  spec.homepage      = %q{http://github.com/tvapi/thetvdb_api}
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", "~> 0.9.2"
  spec.add_runtime_dependency "faraday_middleware", "~> 0.10.0"
  spec.add_runtime_dependency "multi_xml", "~> 0.5.5"
  spec.add_runtime_dependency "rack", "~> 1.6.4"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "coveralls", "~> 0.7"
  spec.add_development_dependency "awesome_print", "~> 1.6.0"
end
