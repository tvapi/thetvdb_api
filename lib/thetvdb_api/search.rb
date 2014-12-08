class ThetvdbApi::Search < ThetvdbApi::Base
  # Find the series data based on its name.
  #
  # access: FREE
  # param (flat params):
  #   get_series(series name)
  #   get_series('Buffy')
  # param (hash params):
  #   get_series(name: 'Buffy')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetSeries
  def get_series(*options)
    get_series_path_with_params(*options).get
  end

  # Find the series data based on its name - return only url.
  #
  # access: FREE
  # param (flat params):
  #   get_series_url(series name)
  #   get_series_url('Buffy')
  # param (hash params):
  #   get_series_url(name: 'Buffy')
  # output: url string
  def get_series_url(*options)
    get_series_path_with_params(*options).url
  end

  # Find the series data by unique ID's used on other sites.
  #
  # access: FREE
  # param: options hash
  #   imdbid: IMDb ID (don't use with zap2itid)
  #   zap2it: Zap2it ID (don't use with imdbid)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetSeriesByRemoteID
  def get_series_by_remote_id(options = {})
    get_series_by_remote_id_path_with_params(options).get
  end

  # Find the series data by unique ID's used on other sites - return only url.
  #
  # access: FREE
  # param: options hash
  #   imdbid: IMDb ID (don't use with zap2itid)
  #   zap2itid: Zap2it ID (don't use with imdbid)
  # output: url string
  def get_series_by_remote_id_url(options = {})
    get_series_by_remote_id_path_with_params(options).url
  end

  # Find the series data by unique IMDB ID
  #
  # access: FREE
  # param (flat params):
  #   get_series_by_imdb_id(imdb_id)
  #   get_series_by_imdb_id('tt01234')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetSeriesByRemoteID
  def get_series_by_imdb_id(imdb_id)
    get_series_by_remote_id_path_with_params({ imdbid: imdb_id }).get
  end

  # Find the series data by unique IMDB ID - return only url.
  #
  # access: FREE
  # param (flat params):
  #   get_series_by_imdb_id_url(imdb_id)
  #   get_series_by_imdb_id_url('tt01234')
  # output: url string
  def get_series_by_imdb_id_url(imdb_id)
    get_series_by_remote_id_path_with_params({ imdbid: imdb_id }).url
  end

  # Find the series data by unique zap2it ID
  #
  # access: FREE
  # param (flat params):
  #   get_series_by_zap2it_id(zap2it_id)
  #   get_series_by_zap2it_id('SH01234')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetSeriesByRemoteID
  def get_series_by_zap2it_id(zap2it_id)
    get_series_by_remote_id_path_with_params({ zap2itid: zap2it_id }).get
  end

  # Find the series data by unique zap2it ID - return only url.
  #
  # access: FREE
  # param: options hash
  #   get_series_by_zap2it_id_url(zap2it_id)
  #   get_series_by_zap2it_id_url('SH01234')
  # output: url string
  def get_series_by_zap2it_id_url(zap2it_id)
    get_series_by_remote_id_path_with_params({ zap2itid: zap2it_id }).url
  end


  # Find the episode data by episode air date.
  #
  # access: FREE
  # param (flat params):
  #   get_episode(series_id, air date)
  #   get_episode(1234, '2000-01-01')
  # param (hash params):
  #   get_episode(series_id: 1234, air_date: '2000-01-01')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetEpisodeByAirDate
  def get_episode(*options)
    get_episode_path_with_params(*options).get
  end


  # Find the episode data by episode air date - return only url.
  #
  # access: FREE
  # param (flat params):
  #   get_episode_url(series_id, air date)
  #   get_episode_url(1234, '2000-01-01')
  # param (hash params):
  #   get_episode_url(series_id: 1234, air_date: '2000-01-01')
  # output: url string
  def get_episode_url(*options)
    get_episode_path_with_params(*options).url
  end

  private

  def get_series_path_with_params(*options)
    path(get_series_path).params(language_options.merge(normalize_series_name_options(*options)))
  end

  def get_series_path
    'GetSeries.php'
  end

  def get_series_by_remote_id_path_with_params(options)
    path(get_series_by_remote_id_path).params(language_options.merge(options))
  end

  def get_series_by_remote_id_path
    'GetSeriesByRemoteID.php'
  end

  def get_episode_path_with_params(*options)
    path(get_episode_path).params(api_key_with_language_options.merge(normalize_series_id_air_date_options(*options)))
  end

  def get_episode_path
    'GetEpisodeByAirDate.php'
  end
end
