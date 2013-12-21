require 'faraday'
require 'uri_template'

class ThetvdbApi::Base
  def initialize(client)
    @client = client
    @params = {}
    @mapper = nil
  end

  def connection
    @connection ||= Faraday.new(url: base_url)
  end

  def get(uri)
    @uri_template = URITemplate.new(uri)
    self
  end

  def params(options)
    @mapper = options.delete(:mapper)
    @params = { language: @client.language }.merge(options)
    self
  end

  def response
    assert_uri_template
    ThetvdbApi::Response.new(connection.get(uri, @options), @mapper)
  end

  def prepare_uri
    assert_uri_template
    @uri_template.expand(@params.merge(api_key: api_key))
  end

  def url
    "#{base_url}#{uri}"
  end

  def uri
    uri = prepare_uri
    @params.reject!{ |param| restful_param_keys(uri).include?(param.to_s) }

    uri
  end

  def restful_param_keys(uri_expanded)
    @uri_template.extract(uri_expanded).keys
  end


  def series_uri
    '{api_key}/series/{series_id}'
  end

  def language
    @client.language
  end

  def api_key
    @client.api_key
  end

  private

  def assert_uri_template
    raise "Path doesn't exists, use get(path) to setup path for request" unless @uri_template
  end

  def base_url
    'http://thetvdb.com/api/'
  end
end
