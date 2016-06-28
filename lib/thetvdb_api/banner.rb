class ThetvdbApi::Banner < ThetvdbApi::Base
  # Return all of the series banners.
  #
  # access: FREE
  # param:
  #   find(series_id: 1234)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:banners.xml
  def find(series_id:)
    get(find_path(series_id: series_id))
  end

  # Return all of the series banners - return only url.
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
    "#{options[:api_key]}/series/#{series_id}/banners.xml"
  end
end
