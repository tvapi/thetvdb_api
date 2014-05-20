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

  def find_by_absolute_order_path_with_params(options)
    path(find_by_absolute_order_path).
      params({ api_key: @client.options[:api_key], language: @client.options[:language] }.merge(options))
  end

  def find(options = {})
    find_path_with_params(options).get
  end

  def find_url(options = {})
    find_path_with_params(options).url
  end

  def find_path_with_params(options)
    path(find_path).params({ api_key: @client.options[:api_key], language: @client.options[:language] }.merge(options))
  end

  def find_by_order(options)
    find_by_order_path_with_params(options).get
  end

  def find_by_order_url(options)
    find_by_order_path_with_params(options).url
  end

  def find_by_order_path_with_params(options)
    path(find_by_order_path).
      params({ api_key: @client.options[:api_key], language: @client.options[:language] }.merge(options))
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
