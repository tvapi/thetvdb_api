class ThetvdbApi::Search < ThetvdbApi::Base
  def get_series(name, language = self.language)
    get('GetSeries.php').params(seriesname: name, language: language).response
  end

  def get_series_by_imdb_id(id, language = self.language)
    get('GetSeriesByRemoteID.php').params(imdbid: id, language: language).response
  end

  def get_series_by_zap2it_id(id, language = self.language)
    get('GetSeriesByRemoteID.php').params(zap2it: id, language: language).response
  end

  def get_episode_by_air_date(series_id, air_date, language = self.language)
    get('GetEpisodeByAirDate.php').params(seriesid: series_id, airdate: air_date, language: language).response
  end
end
