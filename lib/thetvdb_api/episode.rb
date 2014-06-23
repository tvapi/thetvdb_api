class ThetvdbApi::Episode < ThetvdbApi::Base
  def find_by_default_order(options = {})
    find_by_order(options.merge(order: 'default'))
  end

  def find_by_default_order_url(options = {})
    find_by_order_url(options.merge(order: 'default'))
  end

  def find_by_dvd_order(options = {})
    find_by_order(options.merge(order: 'dvd'))
  end

  def find_by_dvd_order_url(options = {})
    find_by_order_url(options.merge(order: 'dvd'))
  end

  def find_by_absolute_order(options = {})
    find_by_absolute_order_path_with_params(options).get
  end

  def find_by_absolute_order_url(options = {})
    find_by_absolute_order_path_with_params(options).url
  end

  def find(options = {})
    find_path_with_params(options).get
  end

  def find_url(options = {})
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
    ':apikey/episodes/:episode_id/:language.xml'
  end
end
