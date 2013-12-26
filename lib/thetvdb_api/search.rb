class ThetvdbApi::Search < ThetvdbApi::Base
  def get_series(name, options = {})
    get(get_series_path).params({ seriesname: name }.merge(options)).
      response(ThetvdbApi::Response::SearchMultipleSeries)
  end

  def get_series_url(name, options = {})
    get(get_series_path).params({ seriesname: name }.merge(options)).url
  end

  def get_series_by_imdb_id(id, options = {})
    get(get_series_by_remote_id_path).params({ imdbid: id }.merge(options)).
      response(ThetvdbApi::Response::SearchSeries)
  end

  def get_series_by_imdb_id_url(id, options = {})
    get(get_series_by_remote_id_path).params({ imdbid: id }.merge(options)).url
  end

  def get_series_by_zap2it_id(id, options = {})
    get(get_series_by_remote_id_path).params({ zap2it: id }.merge(options)).
      response(ThetvdbApi::Response::SearchSeries)
  end

  def get_series_by_zap2it_id_url(id, options = {})
    get(get_series_by_remote_id_path).params({ zap2it: id }.merge(options)).url
  end

  def get_episode(series_id, air_date, options = {})
    get(get_episode_path).params({ seriesid: series_id, airdate: air_date }.merge(options)).
      response(ThetvdbApi::Response::SearchMultipleEpisode)
  end

  def get_episode_url(series_id, air_date, options = {})
    get(get_episode_path).params({ seriesid: series_id, airdate: air_date }.merge(options)).url
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
