require 'httparty'

class ThetvdbApi::Base
  include HTTParty

  attr_reader :client, :uri, :options

  def initialize(client)
    @client = client
  end

  def get(uri, options = {})
    @uri = uri
    @options = options

    self
  end

  def response
    response = self.class.get(uri, request_options(options))
    response.code == 200 ? response.parsed_response : nil
  end

  def request_options(options = {})
    {
      query: options,
      base_uri: api_url
    }
  end

  def api_url
    client.api_url
  end

  def api_key
    client.api_key
  end

  def language
    client.language
  end
end
