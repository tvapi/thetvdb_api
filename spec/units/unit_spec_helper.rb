require 'spec_helper'

ThetvdbApi::Configuration.configure

RSpec.configure do |config|
  config.before(:suite) do

    class ThetvdbApi::Base
      def connection
        @connection ||= Faraday.new(url: base_url) do |builder|
          builder.adapter :test, Faraday::Adapter::Test::Stubs.new
        end
      end
    end

  end
end
