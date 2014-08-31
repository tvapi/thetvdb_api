class ThetvdbApi::Series < ThetvdbApi::Base
  # Find the series data by series id.
  #
  # access: FREE
  # param: options hash
  #   series_id: TV series ID
  # output: XML string (example: http://thetvdb.com/wiki/index.php/API:Base_Series_Record)
  def find(options = {})
    find_path_with_params(options).get
  end

  # Find the series data by series id - return only url.
  #
  # access: FREE
  # param: options hash
  #   series_id: TV series ID
  # output: url string
  def find_url(options = {})
    find_path_with_params(options).url
  end

  # Find the full series data by series id.
  #
  # access: FREE
  # param: options hash
  #   series_id: TV series ID
  # output: XML string (example: http://thetvdb.com/wiki/index.php/API:Full_Series_Record)
  def find_full(options = {})
    find_full_path_with_params(options).get
  end

  # Find the full series data by series id - return only url.
  #
  # access: FREE
  # param: options hash
  #   series_id: TV series ID
  # output: url string
  def find_full_url(options = {})
    find_full_path_with_params(options).url
  end

  private

  def find_path_with_params(options)
    path(find_path).params(api_key_with_language_options.merge(options))
  end

  def find_path
    ':apikey/series/:series_id/:language.xml'
  end

  def find_full_path_with_params(options)
    path(find_full_path).params(api_key_with_language_options.merge(options))
  end

  def find_full_path
    ':apikey/series/:series_id/all/:language.xml'
  end
end
