class ThetvdbApi::Banner < ThetvdbApi::Base
  def find(series_id, options = {})
    get(find_path).params({ series_id: series_id }.merge(options)).response(ThetvdbApi::Response::Banners)
  end

  def find_url(series_id)
    get(find_path).params(series_id: series_id).url
  end

  private

  def find_path
    "#{series_uri}/banners.xml"
  end
end
