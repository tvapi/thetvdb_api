class ThetvdbApi::Episode < ThetvdbApi::Base
  # Find the episode data, sorts using the default ordering method.
  #
  # access: FREE
  # param: options hash
  #   series_id: TV series ID
  #   season: season number
  #   episode: episode number in season
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  def find_by_default_order(options = {})
    find_by_order(options.merge(order: 'default'))
  end

  # Find the episode data, sorts using the default ordering method - return only url.
  #
  # access: FREE
  # param: options hash
  #   series_id: TV series ID
  #   season: season number
  #   episode: episode number in season
  # output: url string
  def find_by_default_order_url(options = {})
    find_by_order_url(options.merge(order: 'default'))
  end

  # Find the episode data, sorts using the dvd ordering method.
  #
  # access: FREE
  # param: options hash
  #   series_id: TV series ID
  #   season: season number
  #   episode: episode number in season
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  def find_by_dvd_order(options = {})
    find_by_order(options.merge(order: 'dvd'))
  end

  # Find the episode data, sorts using the dvd ordering method - return only url.
  #
  # access: FREE
  # param: options hash
  #   series_id: TV series ID
  #   season: season number
  #   episode: episode number in season
  # output: url string
  def find_by_dvd_order_url(options = {})
    find_by_order_url(options.merge(order: 'dvd'))
  end

  # Find the episode data, sorts using the absolute ordering method.
  #
  # access: FREE
  # param: options hash
  #   series_id: TV series ID
  #   absolute: absolute number in series
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  def find_by_absolute_order(options = {})
    find_by_absolute_order_path_with_params(options).get
  end

  # Find the episode data, sorts using the absolute ordering method - return only url.
  #
  # access: FREE
  # param: options hash
  #   series_id: TV series ID
  #   absolute: absolute number in series
  # output: url string
  def find_by_absolute_order_url(options = {})
    find_by_absolute_order_path_with_params(options).url
  end

  # Find the episode data by episode id.
  #
  # access: FREE
  # param: options hash
  #   episode_id: TV episode ID
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  def find(options = {})
    find_path_with_params(options).get
  end

  # Find the episode data by episode id - return only url.
  #
  # access: FREE
  # param: options hash
  #   episode_id: TV episode ID
  # output: url string
  def find_url(options = {})
    find_path_with_params(options).url
  end

  private

  def find_by_order(options)
    find_by_order_path_with_params(options).get
  end

  def find_by_order_url(options)
    find_by_order_path_with_params(options).url
  end

  def find_by_order_path_with_params(options)
    path(find_by_order_path).params(api_key_with_language_options.merge(options))
  end

  def find_by_order_path
    ':apikey/series/:series_id/:order/:season/:episode/:language.xml'
  end

  def find_by_absolute_order_path_with_params(options)
    path(find_by_absolute_order_path).params(api_key_with_language_options.merge(options))
  end

  def find_by_absolute_order_path
    ':apikey/series/:series_id/absolute/:absolute/:language.xml'
  end

  def find_path_with_params(options)
    path(find_path).params(api_key_with_language_options.merge(options))
  end

  def find_path
    ':apikey/episodes/:episode_id/:language.xml'
  end
end
