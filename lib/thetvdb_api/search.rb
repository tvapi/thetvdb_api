class ThetvdbApi::Search < ThetvdbApi::Base
  def get_series(name, options = {})
    get_series_path_with_params(name, options).get
  end

  def get_series_url(name, options = {})
    get_series_path_with_params(name, options).url
  end

  def get_series_path_with_params(name, options)
    path(get_series_path).params({ seriesname: name, language: @client.options[:language] }.merge(options))
  end

  def get_series_by_imdb_id(id, options = {})
    get_series_by_imdb_id_path_with_params(id, options).get
  end

  def get_series_by_imdb_id_url(id, options = {})
    get_series_by_imdb_id_path_with_params(id, options).url
  end

  def get_series_by_imdb_id_path_with_params(id, options)
    path(get_series_by_remote_id_path).params({ imdbid: id, language: @client.options[:language] }.merge(options))
  end

  def get_series_by_zap2it_id(id, options = {})
    get_series_by_zap2it_id_path_with_params(id, options).get
  end

  def get_series_by_zap2it_id_url(id, options = {})
    get_series_by_zap2it_id_path_with_params(id, options).url
  end

  def get_series_by_zap2it_id_path_with_params(id, options)
    path(get_series_by_remote_id_path).params({ zap2it: id, language: @client.options[:language] }.merge(options))
  end

  def get_episode(series_id, air_date, options = {})
    get_episode_path_with_params(series_id, air_date, options).get
  end

  def get_episode_url(series_id, air_date, options = {})
    get_episode_path_with_params(series_id, air_date, options).url
  end

  def get_episode_path_with_params(series_id, air_date, options)
    path(get_episode_path).params({ seriesid: series_id, airdate: air_date, language: @client.options[:language] }.merge(options))
  end

  private

  def get_series_path
    'GetSeries.php'
  end

  def get_series_by_remote_id_path
    'GetSeriesByRemoteID.php'
  end

  def get_episode_path
    'GetEpisodeByAirDate.php'
  end
end
