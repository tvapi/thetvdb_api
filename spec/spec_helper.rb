require 'rubygems'
require 'bundler/setup'
require 'coveralls'
Coveralls.wear!

require 'thetvdb_api'
require File.join(File.dirname(__FILE__), 'support/thetvdb_api.rb')

raise 'api_key missing, use ThetvdbApi::Configuration' if ThetvdbApi::Configuration.api_key.empty?

class SampleModel
  def auth
    self
  end

  def get(uri)
    self
  end

  def mapper(mapper)
    self
  end

  def params(options = {})
    self
  end

  def response
  end
end

RSpec.configure do |config|
end
