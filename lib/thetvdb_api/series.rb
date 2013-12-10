class ThetvdbApi::Series < ThetvdbApi::Base
  def find(series_id, language = self.language)
    get("#{series_uri(series_id)}#{language}.xml").response
  end

  def find_full(series_id, language = self.language)
    get("#{series_uri(series_id)}all/#{language}.xml").response
  end
end
