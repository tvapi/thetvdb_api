class ThetvdbApi::Search < ThetvdbApi::Base
  # Find the series data based on its name.
  #
  # access: FREE
  # param:
  #   get_series(name: "buffy")
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetSeries
  def get_series(name:, language: nil, user: nil)
    get(get_series_path(name: name, language: language, user: user))
  end

  # Find the series data based on its name - return only url.
  #
  # access: FREE
  # param:
  #   get_series_url(name: 1234)
  # output: url string
  def get_series_url(name:, language: nil, user: nil)
    base_url + get_series_path(name: name, language: language, user: user)
  end

  # Find the series data by unique ID"s used on other sites.
  #
  # access: FREE
  # param: options hash
  #   imdb_id: IMDb ID (don"t use with zap2it_id)
  #   zap2_it: Zap2it ID (don"t use with imdb_id)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetSeriesByRemoteID
  def get_series_by_remote_id(imdb_id: nil, zap2it_id: nil, language: nil)
    get(get_series_by_remote_id_path(imdb_id: imdb_id, zap2it_id: zap2it_id, language: language))
  end

  # Find the series data by unique ID"s used on other sites - return only url.
  #
  # access: FREE
  # param: options hash
  #   imdb_id: IMDb ID (don"t use with zap2it_id)
  #   zap2it_id: Zap2it ID (don"t use with imdb_id)
  # output: url string
  def get_series_by_remote_id_url(imdb_id: nil, zap2it_id: nil, language: nil)
    base_url + get_series_by_remote_id_path(imdb_id: imdb_id, zap2it_id: zap2it_id, language: language)
  end

  # Find the episode data by episode air date.
  #
  # access: FREE
  # param (hash params):
  #   get_episode(series_id: 1234, air_date: "2000-01-01")
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetEpisodeByAirDate
  def get_episode(series_id:, air_date:, language: nil)
    get(get_episode_path(series_id: series_id, air_date: air_date, language: language))
  end

  # Find the episode data by episode air date - return only url.
  #
  # access: FREE
  # param (hash params):
  #   get_episode_url(series_id: 1234, air_date: "2000-01-01")
  # output: url string
  def get_episode_url(series_id:, air_date:, language: nil)
    base_url + get_episode_path(series_id: series_id, air_date: air_date, language: language)
  end

  private

  def get_series_path(name:, language: nil, user: nil)
    query = build_query(seriesname: name, language: language, user: user)
    "GetSeries.php#{query}"
  end

  def get_series_by_remote_id_path(imdb_id: nil, zap2it_id: nil, language: nil)
    query = build_query(imdbid: imdb_id, zap2it: zap2it_id, language: language)
    "GetSeriesByRemoteID.php#{query}"
  end

  def get_episode_path(series_id:, air_date:, language: nil)
    query = build_query(apikey: options[:api_key], seriesid: series_id, airdate: air_date, language: language)
    "GetEpisodeByAirDate.php#{query}"
  end
end
