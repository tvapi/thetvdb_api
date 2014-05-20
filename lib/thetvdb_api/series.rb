class ThetvdbApi::Series < ThetvdbApi::Base
  def find(options = {})
    find_path_with_params(options).get
  end

  def find_url(options = {})
    find_path_with_params(options).url
  end

  def find_path_with_params(options)
    path(find_path).params({ api_key: @client.options[:api_key], language: @client.options[:language] }.merge(options))
  end

  def find_full(options = {})
    find_full_path_with_params(options).get
  end

  def find_full_url(options = {})
    find_full_path_with_params(options).url
  end

  def find_full_path_with_params(options)
    path(find_full_path).params({ api_key: @client.options[:api_key], language: @client.options[:language] }.merge(options))
  end

  private

  def find_path
    "#{series_uri}/{language}.xml"
  end

  def find_full_path
    "#{series_uri}/all/{language}.xml"
  end
end
