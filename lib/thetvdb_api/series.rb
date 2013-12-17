class ThetvdbApi::Series < ThetvdbApi::Base
  def find(series_id, language = self.language)
    get("#{series_uri}/{language}.xml").params(series_id: series_id, language: language).response
  end

  def find_full(series_id, language = self.language)
    get("#{series_uri}/all/{language}.xml").params(series_id: series_id, language: language).response
  end
end
