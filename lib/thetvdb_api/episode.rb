class ThetvdbApi::Episode < ThetvdbApi::Base
  # Find the episode data, sorts using the default ordering method.
  #
  # access: FREE
  # param (flat params):
  #   find_by_default_order(series_id, season, episode)
  #   find_by_default_order(1234, 1, 2)
  # param (hash params):
  #   find_by_default_order(series_id: 1234, season: 1, episode: 1)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  def find_by_default_order(*options)
    find_by_order(normalize_series_id_episode_options(*options).merge(order: 'default'))
  end

  # Find the episode data, sorts using the default ordering method - return only url.
  #
  # access: FREE
  # param (flat params):
  #   find_by_default_order_url(series_id, season, episode)
  #   find_by_default_order_url(1234, 1, 2)
  # param (hash params):
  #   find_by_default_order_url(series_id: 1234, season: 1, episode: 1)
  # output: url string
  def find_by_default_order_url(*options)
    find_by_order_url(normalize_series_id_episode_options(*options).merge(order: 'default'))
  end

  # Find the episode data, sorts using the dvd ordering method.
  #
  # access: FREE
  # param (flat params):
  #   find_by_dvd_order(series_id, season, episode)
  #   find_by_dvd_order(1234, 1, 2)
  # param (hash params):
  #   find_by_dvd_order(series_id: 1234, season: 1, episode: 1)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  def find_by_dvd_order(*options)
    find_by_order(normalize_series_id_episode_options(*options).merge(order: 'dvd'))
  end

  # Find the episode data, sorts using the dvd ordering method - return only url.
  #
  # access: FREE
  # param: options hash
  # param (flat params):
  #   find_by_dvd_order_url(series_id, season, episode)
  #   find_by_dvd_order_url(1234, 1, 2)
  # param (hash params):
  #   find_by_dvd_order_url(series_id: 1234, season: 1, episode: 1)
  # output: url string
  def find_by_dvd_order_url(*options)
    find_by_order_url(normalize_series_id_episode_options(*options).merge(order: 'dvd'))
  end

  # Find the episode data, sorts using the absolute ordering method.
  #
  # access: FREE
  # param (flat params):
  #   find_by_absolute_order(series_id, absolute)
  #   find_by_absolute_order(1234, 1)
  # param (hash params):
  #   find_by_absolute_order(series_id: 1234, absolute: 1)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  def find_by_absolute_order(*options)
    find_by_absolute_order_path_with_params(*options).get
  end

  # Find the episode data, sorts using the absolute ordering method - return only url.
  #
  # access: FREE
  # param: options hash
  # param (flat params):
  #   find_by_absolute_order_url(series_id, absolute)
  #   find_by_absolute_order_url(1234, 1)
  # param (hash params):
  #   find_by_absolute_order_url(series_id: 1234, absolute: 1)
  # output: url string
  def find_by_absolute_order_url(*options)
    find_by_absolute_order_path_with_params(*options).url
  end

  # Find the episode data by episode id.
  #
  # access: FREE
  # param (flat params):
  #   find(episode_id)
  #   find(1234)
  # param (hash params):
  #   find(episode_id: 1234)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  def find(*options)
    find_path_with_params(*options).get
  end

  # Find the episode data by episode id - return only url.
  #
  # access: FREE
  # param (flat params):
  #   find_url(episode_id)
  #   find_url(1234)
  # param (hash params):
  #   find_url(episode_id: 1234)
  # output: url string
  def find_url(*options)
    find_path_with_params(*options).url
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

  def find_by_absolute_order_path_with_params(*options)
    path(find_by_absolute_order_path).params(api_key_with_language_options.merge(normalize_series_id_absolute_options(*options)))
  end

  def find_by_absolute_order_path
    ':apikey/series/:series_id/absolute/:absolute/:language.xml'
  end

  def find_path_with_params(*options)
    path(find_path).params(api_key_with_language_options.merge(normalize_episode_id_options(*options)))
  end

  def find_path
    ':apikey/episodes/:episode_id/:language.xml'
  end
end
