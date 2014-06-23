require 'faraday'
require 'uri_template'
require 'service_api'

class ThetvdbApi::Base
  include ServiceApi::BaseFaraday

  def api_key_options
    { api_key: @client.options[:api_key] }
  end

  def language_options
    { language: @client.options[:language] }
  end

  def api_key_with_language_options
    api_key_options.merge(language_options)
  end

  private

  def uri_kind
    :colon
  end

  def base_url
    'http://thetvdb.com/api/'
  end
end
