class ThetvdbApi::Banner < ThetvdbApi::Base
  def find(series_id, options = {})
    get("#{series_uri}/banners.xml").params({ series_id: series_id }.merge(options)).response
  end
end
