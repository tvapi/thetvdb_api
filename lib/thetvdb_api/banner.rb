class ThetvdbApi::Banner < ThetvdbApi::Base
  # Return all of the series banners.
  #
  # access: FREE
  # param: options hash
  #   series_id: TV series name
  # output: Faraday::Response instance with parsed XML string (example: http://thetvdb.com/wiki/index.php/API:banners.xml)
  def find(options = {})
    find_path_with_params(options).get
  end

  # Return all of the series banners - return only url.
  #
  # access: FREE
  # param: options hash
  #   series_id: TV series name
  # output: url string
  def find_url(options = {})
    find_path_with_params(options).url
  end

  private

  def find_path_with_params(options)
    path(find_path).params(api_key_options.merge(options))
  end

  def find_path
    ':apikey/series/:series_id/banners.xml'
  end
end
