class ThetvdbApi::Series < ThetvdbApi::Base
  def find(series_id, options = {})
    get("#{series_uri}/{language}.xml").params({ series_id: series_id }.merge(options)).response
  end

  def find_full(series_id, options = {})
    get("#{series_uri}/all/{language}.xml").params({ series_id: series_id }.merge(options)).response
  end
end
