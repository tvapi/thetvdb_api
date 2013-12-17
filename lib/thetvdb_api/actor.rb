class ThetvdbApi::Actor < ThetvdbApi::Base
  def find(series_id)
    get("#{series_uri}/actors.xml").params(series_id: series_id).response
  end
end
