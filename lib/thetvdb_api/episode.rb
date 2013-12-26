class ThetvdbApi::Episode < ThetvdbApi::Base
  def find_by_default_order(series_id, season, episode, options = {})
    find_by_order('default', series_id, season, episode, options)
  end

  def find_by_dvd_order(series_id, season, episode, options = {})
    find_by_order('dvd', series_id, season, episode, options)
  end

  def find_by_absolute_order(series_id, absolute, options = {})
    get("#{series_uri}/absolute/{absolute}/{language}.xml").
      params({ series_id: series_id, absolute: absolute }.merge(options)).response(ThetvdbApi::Response::Episode)
  end

  def find(episode_id, options = {})
    get("{api_key}/episodes/{episode_id}/{language}.xml").params({ episode_id: episode_id }.merge(options)).
      response(ThetvdbApi::Response::Episode)
  end

  def find_by_order(order, series_id, season, episode, options)
    get("#{series_uri}/{order}/{season}/{episode}/{language}.xml").
      params({ series_id: series_id, season: season, episode: episode, order: order }.merge(options)).
      response(ThetvdbApi::Response::Episode)
  end
end
