class ThetvdbApi::Actor < ThetvdbApi::Base
  def find(series_id, options = {})
    get(find_path).params({ series_id: series_id }.merge(options)).response(ThetvdbApi::Response::Actors)
  end

  def find_url(series_id)
    get(find_path).params(series_id: series_id).url
  end

  private

  def find_path
    "#{series_uri}/actors.xml"
  end
end
