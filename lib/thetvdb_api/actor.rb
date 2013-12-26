class ThetvdbApi::Actor < ThetvdbApi::Base
  def find(series_id, options = {})
    get("#{series_uri}/actors.xml").params({ series_id: series_id }.merge(options)).
      response(ThetvdbApi::Response::Actors)
  end
end
