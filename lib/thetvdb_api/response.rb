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
    @body ||= @mapping ? parse : @faraday_response.body
  end

  def inspect
    body.inspect
  end

  def [](key)
    parse[key]
  end

  def []=(key, value)
    parse[key] = value
  end

  def each(&block)
    parse.each(&block)
  end

  def multi_xml_parse
    MultiXml.parse(@faraday_response.body)
  end

  def xml_parse
    multi_xml_parse
  end

  def parse
    @parse ||= xml_parse
  end
end
