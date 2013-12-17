class ThetvdbApi::Episode < ThetvdbApi::Base
  def find_by_default_order(series_id, season, episode, language = self.language)
    find_by_order('default', series_id, season, episode, language)
  end

  def find_by_dvd_order(series_id, season, episode, language = self.language)
    find_by_order('dvd', series_id, season, episode, language)
  end

  def find_by_absolute_order(series_id, absolute, language = self.language)
    get("#{series_uri}/absolute/{absolute}/{language}.xml").
      params(series_id: series_id, absolute: absolute, language: language).response
  end

  def find(episode_id, language = self.language)
    get("{api_key}/episodes/{episode_id}/{language}.xml").params(episode_id: episode_id, language: language).response
  end

  def find_by_order(order, series_id, season, episode, language)
    get("#{series_uri}/{order}/{season}/{episode}/{language}.xml").
      params(series_id: series_id, season: season, episode: episode, language: language, order: order).response
  end
end
