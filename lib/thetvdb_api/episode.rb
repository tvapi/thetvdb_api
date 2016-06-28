class ThetvdbApi::Episode < ThetvdbApi::Base
  # Find the episode data, sorts using the default ordering method.
  #
  # access: FREE
  # param:
  #   find_by_default_order(series_id: 1234, season: 1, episode: 1)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  def find_by_default_order(series_id:, season:, episode:, language:)
    path = find_by_order_path(
      order: "default", series_id: series_id, season: season, episode: episode, language: language
    )
    get(path)
  end

  # Find the episode data, sorts using the default ordering method - return only url.
  #
  # access: FREE
  # param:
  #   find_by_default_order_url(series_id: 1234, season: 1, episode: 1)
  # output: url string
  def find_by_default_order_url(series_id:, season:, episode:, language:)
    path = find_by_order_path(
      order: "default", series_id: series_id, season: season, episode: episode, language: language
    )
    base_url + path
  end
  
  # Find the episode data, sorts using the dvd ordering method.
  #
  # access: FREE
  # param:
  #   find_by_dvd_order(series_id: 1234, season: 1, episode: 1)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  def find_by_dvd_order(series_id:, season:, episode:, language:)
    path = find_by_order_path(
      order: "dvd", series_id: series_id, season: season, episode: episode, language: language
    )
    get(path)
  end

  # Find the episode data, sorts using the dvd ordering method - return only url.
  #
  # access: FREE
  # param:
  #   find_by_dvd_order_url(series_id: 1234, season: 1, episode: 1)
  # output: url string
  def find_by_dvd_order_url(series_id:, season:, episode:, language:)
    path = find_by_order_path(
      order: "dvd", series_id: series_id, season: season, episode: episode, language: language
    )
    base_url + path
  end

  # Find the episode data, sorts using the absolute ordering method.
  #
  # access: FREE
  # param:
  #   find_by_absolute_order(series_id: 1234, absolute: 1)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  def find_by_absolute_order(series_id:, absolute:, language:)
    get(find_by_absolute_order_path(series_id: series_id, absolute: absolute, language: language))
  end

  # Find the episode data, sorts using the dvd absolute method - return only url.
  #
  # access: FREE
  # param:
  #   find_by_absolute_order_url(series_id: 1234, absolute: 1)
  # output: url string
  def find_by_absolute_order_url(series_id:, absolute:, language:)
    base_url + find_by_absolute_order_path(series_id: series_id, absolute: absolute, language: language)
  end
  
  # Find the episode data, sorts using the absolute ordering method.
  #
  # access: FREE
  # param:
  #   find(id: 1234)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  def find(id:, language:)
    get(find_path(id: id, language: language))
  end

  # Find the episode data, sorts using the dvd absolute method - return only url.
  #
  # access: FREE
  # param:
  #   find_url(id: 1234)
  # output: url string
  def find_url(id:, language:)
    base_url + find_path(id: id, language: language)
  end

  private

  def find_by_order_path(order:, series_id:, season:, episode:, language:)
    "#{options[:api_key]}/series/#{series_id}/#{order}/#{season}/#{episode}/#{language}.xml"
  end

  def find_by_absolute_order_path(series_id:, absolute:, language:)
    "#{options[:api_key]}/series/#{series_id}/absolute/#{absolute}/#{language}.xml"
  end

  def find_path(id:, language:)
    "#{options[:api_key]}/episodes/#{id}/#{language}.xml"
  end
end
