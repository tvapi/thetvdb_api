require "faraday"
require "faraday_middleware"
require "rack/utils"

class ThetvdbApi::Base
  def initialize(options = {})
    @options = options
    @connection = build_connection
  end

  private

  attr_reader :connection, :options

  def build_connection
    connection = Faraday.new(url: base_url)
    connection.response :xml, content_type: /\bxml$/
    setup_adapter(connection)
    connection
  end

  def setup_adapter(connection)
    connection.adapter(options[:adapter] || :net_http)
  end

  def get(uri, query = {})
    connection.get(uri, query)
  end

  def build_query(**params)
    query = Rack::Utils.build_query(params.select{ |_, value| !value.nil? })
    return if query.size == 0
    "?#{query}"
  end

  def base_url
    "http://thetvdb.com/api/"
  end
end
