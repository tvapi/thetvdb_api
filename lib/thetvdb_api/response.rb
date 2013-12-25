require 'multi_xml'

class ThetvdbApi::Response
  def initialize(faraday_response, mapping = false)
    @faraday_response = faraday_response
    @mapping = mapping
  end

  def env
    @faraday_response.env
  end

  def status
    @faraday_response.status
  end

  def headers
    @faraday_response.headers
  end

  def body
    @body ||= @mapping ? MultiXml.parse(@faraday_response.body) : @faraday_response.body
  end

  def inspect
    "<ThetvdbApi::Response body=#{body.inspect}>"
  end
end
