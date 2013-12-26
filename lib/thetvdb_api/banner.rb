class ThetvdbApi::Banner < ThetvdbApi::Base
  def find(series_id, options = {})
    find_get_with_params(series_id, options).response(ThetvdbApi::Response::Banners)
  end

  def find_url(series_id)
    find_get_with_params(series_id).url
  end

  def find_get_with_params(series_id, options = {})
    get(find_path).params({ series_id: series_id }.merge(options))
  end

  private

  def find_path
    "#{series_uri}/banners.xml"
  end
end
