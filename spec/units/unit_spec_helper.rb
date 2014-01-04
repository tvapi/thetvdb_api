require 'spec_helper'

ThetvdbApi::Configuration.configure do |config|
  config.adapter = :test
end

RSpec.configure do |config|
end
