class ThetvdbApi::Response
  def initialize(faraday_response, mapper = nil)
    @faraday_response = faraday_response
    @mapper = mapper
  end

  def mapper
    @mapper
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
    @body ||= @mapper ? @mapper.parse(@faraday_response.body) : @faraday_response.body
  end

  def inspect
    "<ThetvdbApi::Response body=#{body.inspect}, mapper=#{mapper.inspect}>"
  end
end
