class ThetvdbApi::Episode < ThetvdbApi::Base
  def find_by_default_order(series_id, season, episode, language = self.language)
    get("#{series_uri}/default/#{shared_uri_suffix}").
      params(series_id: series_id, season: season, episode: episode, language: language).response
  end

  def find_by_dvd_order(series_id, season, episode, language = self.language)
    get("#{series_uri}/dvd/#{shared_uri_suffix}").
      params(series_id: series_id, season: season, episode: episode, language: language).response
  end

  def find_by_absolute_order(series_id, absolute, language = self.language)
    get("#{series_uri}/absolute/{absolute}/{language}.xml").
      params(series_id: series_id, absolute: absolute, language: language).response
  end

  def find(episode_id, language = self.language)
    get("{api_key}/episodes/{episode_id}/{language}.xml").params(episode_id: episode_id, language: language).response
  end

  def shared_uri_suffix
    '{season}/{episode}/{language}.xml'
  end
end
