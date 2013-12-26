module ThetvdbApi::Response::Collection
  def body
    @body ||= if @mapping
      parse.is_a?(Array) ? parse : [parse]
    else
      @faraday_response.body
    end
  end
end