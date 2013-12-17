class ThetvdbApi::Banner < ThetvdbApi::Base
  def find(series_id)
    get("#{series_uri}/banners.xml").params(series_id: series_id).response
  end
end
