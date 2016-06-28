class ThetvdbApi::Actor < ThetvdbApi::Base
  # Return all of the series actors.
  #
  # access: FREE
  # param:
  #   find(series_id: 1234)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:actors.xml
  def find(series_id:)
    get(find_path(series_id: series_id))
  end

  # Return all of the series actors.
  #
  # access: FREE
  # param:
  #   find_url(series_id: 1234)
  # output: url string
  def find_url(series_id:)
    base_url + find_path(series_id: series_id)
  end

  private

  def find_path(series_id:)
    "#{options[:api_key]}/series/#{series_id}/actors.xml"
  end
end
