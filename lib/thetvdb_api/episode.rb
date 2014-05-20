class ThetvdbApi::Episode < ThetvdbApi::Base
  def find_by_default_order(series_id, season, episode, options = {})
    find_by_order('default', series_id, season, episode, options)
  end

  def find_by_default_order_url(series_id, season, episode, options = {})
    find_by_order_url('default', series_id, season, episode, options)
  end

  def find_by_dvd_order(series_id, season, episode, options = {})
    find_by_order('dvd', series_id, season, episode, options)
  end

  def find_by_dvd_order_url(series_id, season, episode, options = {})
    find_by_order_url('dvd', series_id, season, episode, options)
  end

  def find_by_absolute_order(series_id, absolute, options = {})
    find_by_absolute_order_path_with_params(series_id, absolute, options).get
  end

  def find_by_absolute_order_url(series_id, absolute, options = {})
    find_by_absolute_order_path_with_params(series_id, absolute, options).url
  end

  def find_by_absolute_order_path_with_params(series_id, absolute, options)
    path(find_by_absolute_order_path).
      params({ series_id: series_id, absolute: absolute, api_key: @client.options[:api_key], language: @client.options[:language] }.merge(options))
  end

  def find(episode_id, options = {})
    find_path_with_params(episode_id, options).get
  end

  def find_url(episode_id, options = {})
    find_path_with_params(episode_id, options).url
  end

  def find_path_with_params(episode_id, options)
    path(find_path).params({ episode_id: episode_id, api_key: @client.options[:api_key], language: @client.options[:language] }.merge(options))
  end

  def find_by_order(order, series_id, season, episode, options)
    find_by_order_path_with_params(order, series_id, season, episode, options).get
  end

  def find_by_order_url(order, series_id, season, episode, options)
    find_by_order_path_with_params(order, series_id, season, episode, options).url
  end

  def find_by_order_path_with_params(order, series_id, season, episode, options)
    path(find_by_order_path).
      params({ series_id: series_id, season: season, episode: episode, order: order, api_key: @client.options[:api_key], language: @client.options[:language] }.merge(options))
  end

  private

  def find_by_absolute_order_path
    "#{series_uri}/absolute/{absolute}/{language}.xml"
  end

  def find_path
    '{api_key}/episodes/{episode_id}/{language}.xml'
  end

  def find_by_order_path
    "#{series_uri}/{order}/{season}/{episode}/{language}.xml"
  end
end
