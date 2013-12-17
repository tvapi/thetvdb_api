require 'httparty'

class ThetvdbApi::Base
  include HTTParty
  base_uri 'http://thetvdb.com/api/'

  def initialize(client)
    @client = client
  end

  def get(uri, options = {})
    @uri = uri
    @options = options

    self
  end

  def response
    self.class.get(uri, query: options)
  end

  def series_uri(series_id)
    "#{api_key}/series/#{series_id}/"
  end

  def api_key
    @client.api_key
  end

  def language
    @client.language
  end
end
