class ThetvdbApi::Episode < ThetvdbApi::Base
  include Ov

  # Find the episode data, sorts using the default ordering method.
  #
  # access: FREE
  # param:
  #   find_by_default_order(1234, 1, 2)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  let :find_by_default_order, Any, Any, Any do |series_id, season, episode|
    find_by_default_order(series_id: series_id, season: season, episode: episode)
  end

  # Find the episode data, sorts using the default ordering method.
  #
  # access: FREE
  # param:
  #   find_by_default_order(1234, 1, 2, 'de')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  let :find_by_default_order, Any, Any, Any, String do |series_id, season, episode, language|
    find_by_default_order(series_id: series_id, season: season, episode: episode, language: language)
  end

  # Find the episode data, sorts using the default ordering method.
  #
  # access: FREE
  # param:
  #   find_by_default_order(series_id: 1234, season: 1, episode: 1)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  let :find_by_default_order, Hash do |options|
    find_by_order(options.merge(order: 'default'))
  end

  # Find the episode data, sorts using the default ordering method - return only url.
  #
  # access: FREE
  # param:
  #   find_by_default_order_url(1234, 1, 2)
  # output: url string
  let :find_by_default_order_url, Any, Any, Any do |series_id, season, episode|
    find_by_default_order_url(series_id: series_id, season: season, episode: episode)
  end

  # Find the episode data, sorts using the default ordering method - return only url.
  #
  # access: FREE
  # param:
  #   find_by_default_order_url(1234, 1, 2, 'de')
  # output: url string
  let :find_by_default_order_url, Any, Any, Any, String do |series_id, season, episode, language|
    find_by_default_order_url(series_id: series_id, season: season, episode: episode, language: language)
  end

  # Find the episode data, sorts using the default ordering method - return only url.
  #
  # access: FREE
  # param:
  #   find_by_default_order_url(series_id: 1234, season: 1, episode: 1)
  # output: url string
  let :find_by_default_order_url, Hash do |options|
    find_by_order_url(options.merge(order: 'default'))
  end
  
  # Find the episode data, sorts using the dvd ordering method.
  #
  # access: FREE
  # param:
  #   find_by_dvd_order(1234, 1, 2)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  let :find_by_dvd_order, Any, Any, Any do |series_id, season, episode|
    find_by_dvd_order(series_id: series_id, season: season, episode: episode)
  end

  # Find the episode data, sorts using the dvd ordering method.
  #
  # access: FREE
  # param:
  #   find_by_dvd_order(1234, 1, 2, 'de')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  let :find_by_dvd_order, Any, Any, Any, String do |series_id, season, episode, language|
    find_by_dvd_order(series_id: series_id, season: season, episode: episode, language: language)
  end

  # Find the episode data, sorts using the dvd ordering method.
  #
  # access: FREE
  # param:
  #   find_by_dvd_order(series_id: 1234, season: 1, episode: 1)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  let :find_by_dvd_order, Hash do |options|
    find_by_order(options.merge(order: 'dvd'))
  end

  # Find the episode data, sorts using the dvd ordering method - return only url.
  #
  # access: FREE
  # param:
  #   find_by_dvd_order_url(1234, 1, 2)
  # output: url string
  let :find_by_dvd_order_url, Any, Any, Any do |series_id, season, episode|
    find_by_dvd_order_url(series_id: series_id, season: season, episode: episode)
  end

  # Find the episode data, sorts using the dvd ordering method - return only url.
  #
  # access: FREE
  # param:
  #   find_by_dvd_order_url(1234, 1, 2, 'de')
  # output: url string
  let :find_by_dvd_order_url, Any, Any, Any, String do |series_id, season, episode, language|
    find_by_dvd_order_url(series_id: series_id, season: season, episode: episode, language: language)
  end

  # Find the episode data, sorts using the dvd ordering method - return only url.
  #
  # access: FREE
  # param:
  #   find_by_dvd_order_url(series_id: 1234, season: 1, episode: 1)
  # output: url string
  let :find_by_dvd_order_url, Hash do |options|
    find_by_order_url(options.merge(order: 'dvd'))
  end

  # Find the episode data, sorts using the absolute ordering method.
  #
  # access: FREE
  # param:
  #   find_by_absolute_order(1234, 1)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  let :find_by_absolute_order, Any, Any do |series_id, absolute|
    find_by_absolute_order(series_id: series_id, absolute: absolute)
  end

  # Find the episode data, sorts using the absolute ordering method.
  #
  # access: FREE
  # param:
  #   find_by_absolute_order(1234, 1, 'de')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  let :find_by_absolute_order, Any, Any, String do |series_id, absolute, language|
    find_by_absolute_order(series_id: series_id, absolute: absolute, language: language)
  end

  # Find the episode data, sorts using the absolute ordering method.
  #
  # access: FREE
  # param:
  #   find_by_absolute_order(series_id: 1234, absolute: 1)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  let :find_by_absolute_order, Hash do |options|
    find_by_absolute_order_path_with_params(options).get
  end

  # Find the episode data, sorts using the absolute ordering method - return only url.
  #
  # access: FREE
  # param:
  #   find_by_absolute_order_url(1234, 1)
  # output: url string
  let :find_by_absolute_order_url, Any, Any do |series_id, absolute|
    find_by_absolute_order_url(series_id: series_id, absolute: absolute)
  end

  # Find the episode data, sorts using the absolute ordering method - return only url.
  #
  # access: FREE
  # param:
  #   find_by_absolute_order_url(1234, 1, 'de')
  # output: url string
  let :find_by_absolute_order_url, Any, Any, String do |series_id, absolute, language|
    find_by_absolute_order_url(series_id: series_id, absolute: absolute, language: language)
  end

  # Find the episode data, sorts using the dvd absolute method - return only url.
  #
  # access: FREE
  # param:
  #   find_by_absolute_order_url(series_id: 1234, absolute: 1)
  # output: url string
  let :find_by_absolute_order_url, Hash do |options|
    find_by_absolute_order_path_with_params(options).url
  end
  
  # Find the episode data, sorts using the absolute ordering method.
  #
  # access: FREE
  # param:
  #   find(1234)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  let :find, Any do |id|
    find(id: id)
  end

  # Find the episode data, sorts using the absolute ordering method.
  #
  # access: FREE
  # param:
  #   find(1234, 'de')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  let :find, Any, String do |id, language|
    find(id: id, language: language)
  end

  # Find the episode data, sorts using the absolute ordering method.
  #
  # access: FREE
  # param:
  #   find(id: 1234)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Episode_Record
  let :find, Hash do |options|
    find_path_with_params(options).get
  end

  # Find the episode data, sorts using the absolute ordering method - return only url.
  #
  # access: FREE
  # param:
  #   find_url(1234)
  # output: url string
  let :find_url, Any do |id|
    find_url(id: id)
  end

  # Find the episode data, sorts using the absolute ordering method - return only url.
  #
  # access: FREE
  # param:
  #   find_url(1234, 'de')
  # output: url string
  let :find_url, Any, String do |id, language|
    find_url(id: id, language: language)
  end

  # Find the episode data, sorts using the dvd absolute method - return only url.
  #
  # access: FREE
  # param:
  #   find_url(id: 1234)
  # output: url string
  let :find_url, Hash do |options|
    find_path_with_params(options).url
  end

  private

  def find_by_order(options)
    find_by_order_path_with_params(options).get
  end

  def find_by_order_url(options)
    find_by_order_path_with_params(options).url
  end

  def find_by_order_path_with_params(options)
    path(find_by_order_path).params(api_key_with_language_options.merge(options))
  end

  def find_by_order_path
    ':apikey/series/:series_id/:order/:season/:episode/:language.xml'
  end

  def find_by_absolute_order_path_with_params(options)
    path(find_by_absolute_order_path).params(api_key_with_language_options.merge(options))
  end

  def find_by_absolute_order_path
    ':apikey/series/:series_id/absolute/:absolute/:language.xml'
  end

  def find_path_with_params(options)
    path(find_path).params(api_key_with_language_options.merge(options))
  end

  def find_path
    ':apikey/episodes/:id/:language.xml'
  end
end
