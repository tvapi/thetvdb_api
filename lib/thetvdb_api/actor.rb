class ThetvdbApi::Actor < ThetvdbApi::Base
  def find(options = {})
    find_path_with_params(options).get
  end

  def find_url(options = {})
    find_path_with_params(options).url
  end

  def find_path_with_params(options)
    path(find_path).params({ api_key: @client.options[:api_key] }.merge(options))
  end

  private

  def find_path
    "#{series_uri}/actors.xml"
  end
end
