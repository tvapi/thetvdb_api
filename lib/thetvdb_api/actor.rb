class ThetvdbApi::Actor < ThetvdbApi::Base
  def find(series_id)
    get("#{series_uri(series_id)}actors.xml").response
  end
end
