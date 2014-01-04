require 'spec_helper'
require 'functionals/support/stub_faraday'

ThetvdbApi::Configuration.configure do |config|
  config.api_key = '123456789'
  config.adapter = :test
end
