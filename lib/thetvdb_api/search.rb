class ThetvdbApi::Search < ThetvdbApi::Base
  # Find the series data based on its name.
  #
  # access: FREE
  # param: options hash
  #   seriesname: TV series name
  # output: XML string (example: http://thetvdb.com/wiki/index.php/API:GetSeries)
  def get_series(options = {})
    get_series_path_with_params(options).get
  end

  # Find the series data based on its name - return only url.
  #
  # access: FREE
  # param: options hash
  #   seriesname: TV series name
  # output: url string
  def get_series_url(options = {})
    get_series_path_with_params(options).url
  end

  # Find the series data by unique ID's used on other sites.
  #
  # access: FREE
  # param: options hash
  #   imdbid: IMDb ID (don't use with zap2itid)
  #   zap2itid: Zap2it ID (don't use with imdbid)
  # output: XML string (example: http://thetvdb.com/wiki/index.php/API:GetSeriesByRemoteID)
  def get_series_by_remote_id(options = {})
    get_series_by_remote_id_path_with_params(options).get
  end

  # Find the series data by unique ID's used on other sites - return only url.
  #
  # access: FREE
  # param: options hash
  #   seriesid: IMDb ID (don't use with zap2itid)
  #   zap2itid: Zap2it ID (don't use with imdbid)
  # output: url string
  def get_series_by_remote_id_url(options = {})
    get_series_by_remote_id_path_with_params(options).url
  end


  # Find the episode data by episode air date.
  #
  # access: FREE
  # param: options hash
  #   seriesid: This is the seriesid for the series you want to use for finding episodes.
  #   airdate: This is the date the episode aired on you are trying to lookup. This can be supplied in any valid date
  #            type. Example: 2008-01-01, 2008-1-1, January 1, 2008, 1/1/2008, etc
  # output: XML string (example: http://thetvdb.com/wiki/index.php/API:GetEpisodeByAirDate)
  def get_episode(options = {})
    get_episode_path_with_params(options).get
  end


  # Find the episode data by episode air date - return only url.
  #
  # access: FREE
  # param: options hash
  #   seriesid: This is the seriesid for the series you want to use for finding episodes.
  #   airdate: This is the date the episode aired on you are trying to lookup. This can be supplied in any valid date
  #            type. Example: 2008-01-01, 2008-1-1, January 1, 2008, 1/1/2008, etc
  # output: url string
  def get_episode_url(options = {})
    get_episode_path_with_params(options).url
  end

  private

  def get_series_path_with_params(options)
    path(get_series_path).params(language_options.merge(options))
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

  def get_episode_path_with_params(options)
    path(get_episode_path).params(api_key_with_language_options.merge(options))
  end

  def get_episode_path
    'GetEpisodeByAirDate.php'
  end
end
