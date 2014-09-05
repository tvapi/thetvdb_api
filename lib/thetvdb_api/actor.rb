class ThetvdbApi::Actor < ThetvdbApi::Base
  # Return all of the series actors.
  #
  # access: FREE
  # param (flat params):
  #   find(series_id)
  #   find(1234)
  # param (hash params):
  #   find(series_id: 1234)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:actors.xml
  def find(*options)
    find_path_with_params(*options).get
  end

  # Return all of the series actors - return only url.
  #
  # access: FREE
  # param (flat params):
  #   find_url(series_id)
  #   find_url(1234)
  # param (hash params):
  #   find_url(series_id: 1234)
  # output: url string
  def find_url(*options)
    find_path_with_params(*options).url
  end

  private

  def find_path_with_params(*options)
    path(find_path).params(api_key_options.merge(normalize_series_id_options(*options)))
  end

  def find_path
    ':apikey/series/:series_id/actors.xml'
  end
end
