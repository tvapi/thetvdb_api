# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'thetvdb_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'thetvdb_api'
  spec.version       = ThetvdbApi::VERSION
  spec.authors       = ['Krzysztof Wawer']
  spec.email         = ['krzysztof.wawer@gmail.com']
  spec.description   = %q{Ruby client for accessing TV shows information from the thetvdb.com API}
  spec.summary       = %q{Ruby client for thetvdb.com API}
  spec.homepage      = %q{http://github.com/wafcio/thetvdb_api}
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'confiture', '~> 0.1.4'
  spec.add_runtime_dependency 'faraday', '~> 0.8.8'
  spec.add_runtime_dependency 'uri_template', '~> 0.6.0'
  spec.add_runtime_dependency 'multi_xml', '~> 0.5.5'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.14.1'
  spec.add_development_dependency 'coveralls', '~> 0.7'
end
