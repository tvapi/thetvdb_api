class ThetvdbApi::Series < ThetvdbApi::Base
  def find(series_id, options = {})
    get("#{series_uri}/{language}.xml").params({ series_id: series_id }.merge(options)).
      response(ThetvdbApi::Response::Series)
  end

  def find_full(series_id, options = {})
    get("#{series_uri}/all/{language}.xml").params({ series_id: series_id }.merge(options)).
      response(ThetvdbApi::Response::FullSeries)
  end
end
