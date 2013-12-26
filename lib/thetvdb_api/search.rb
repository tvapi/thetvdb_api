class ThetvdbApi::Search < ThetvdbApi::Base
  def get_series(name, options = {})
    get('GetSeries.php').params({ seriesname: name }.merge(options)).
      response(ThetvdbApi::Response::SearchMultipleSeries)
  end

  def get_series_by_imdb_id(id, options = {})
    get('GetSeriesByRemoteID.php').params({ imdbid: id }.merge(options)).
      response(ThetvdbApi::Response::SearchSeries)
  end

  def get_series_by_zap2it_id(id, options = {})
    get('GetSeriesByRemoteID.php').params({ zap2it: id }.merge(options)).
      response(ThetvdbApi::Response::SearchSeries)
  end

  def get_episode(series_id, air_date, options = {})
    get('GetEpisodeByAirDate.php').params({ seriesid: series_id, airdate: air_date }.merge(options)).
      response(ThetvdbApi::Response::SearchMultipleEpisode)
  end
end
