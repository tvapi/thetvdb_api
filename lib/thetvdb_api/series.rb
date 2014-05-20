class ThetvdbApi::Series < ThetvdbApi::Base
  def find(series_id, options = {})
    find_path_with_params(series_id, options).get
  end

  def find_url(series_id, options = {})
    find_path_with_params(series_id, options).url
  end

  def find_path_with_params(series_id, options)
    path(find_path).params({ series_id: series_id, api_key: @client.options[:api_key], language: @client.options[:language] }.merge(options))
  end

  def find_full(series_id, options = {})
    find_full_path_with_params(series_id, options).get
  end

  def find_full_url(series_id, options = {})
    find_full_path_with_params(series_id, options).url
  end

  def find_full_path_with_params(series_id, options)
    path(find_full_path).params({ series_id: series_id, api_key: @client.options[:api_key], language: @client.options[:language] }.merge(options))
  end

  private

  def find_path
    "#{series_uri}/{language}.xml"
  end

  def find_full_path
    "#{series_uri}/all/{language}.xml"
  end
end
