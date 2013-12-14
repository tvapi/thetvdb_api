class ThetvdbApi::Episode < ThetvdbApi::Base
  def find_by_default_order(series_id, season, episode, language = self.language)
    get("#{series_uri(series_id)}default#{shared_uri_suffix(season, episode, language)}").response
  end

  def find_by_dvd_order(series_id, season, episode, language = self.language)
    get("#{series_uri(series_id)}dvd#{shared_uri_suffix(season, episode, language)}").response
  end

  def find_by_absolute_order(series_id, absolute, language = self.language)
    get("#{series_uri(series_id)}absolute/#{absolute}/#{language}.xml").response
  end

  def find(episode_id, language = self.language)
    get("#{api_key}/episodes/#{episode_id}/#{language}.xml").response
  end

  def shared_uri_suffix(season, episode, language)
    "/#{season}/#{episode}/#{language}.xml"
  end
end
