class ThetvdbApi::Actor < ThetvdbApi::Base
  def find(series_id, options = {})
    find_path_with_params(series_id, options).get
  end

  def find_url(series_id)
    find_path_with_params(series_id).url
  end

  def find_path_with_params(series_id, options = {})
    path(find_path).params({ series_id: series_id, api_key: @client.options[:api_key] }.merge(options))
  end

  private

  def find_path
    "#{series_uri}/actors.xml"
  end
end
