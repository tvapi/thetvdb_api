class ThetvdbApi::Search < ThetvdbApi::Base
  def get_series(name, language = self.language)
    get('GetSeries.php', seriesname: name, language: language).response
  end

  def get_series_by_imdb_id(id, language = self.language)
    get('GetSeriesByRemoteID.php', imdbid: id, language: language).response
  end

  def get_series_by_zap2it_id(id, language = self.language)
    get('GetSeriesByRemoteID.php', zap2it: id, language: language).response
  end

  def get_episode_by_air_date(series_id, air_date, language = self.language)
    get('GetEpisodeByAirDate.php', apikey: api_key, seriesid: series_id, airdate: air_date, language: language).response
  end
end
