class ThetvdbApi::Banner < ThetvdbApi::Base
  def find(series_id)
    get("#{series_uri(series_id)}banners.xml").response
  end
end
