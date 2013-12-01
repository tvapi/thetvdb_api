require 'rubygems'
require 'bundler/setup'
require 'coveralls'
Coveralls.wear!

require 'thetvdb_api'
require File.join(File.dirname(__FILE__), 'support/thetvdb_api.rb')

raise 'api_key missing, use ThetvdbApi::Configuration' if ThetvdbApi::Configuration.api_key.empty?

RSpec.configure do |config|
end
