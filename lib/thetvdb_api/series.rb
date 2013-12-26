class ThetvdbApi::Series < ThetvdbApi::Base
  def find(series_id, options = {})
    find_get_with_params(series_id, options).response(ThetvdbApi::Response::Series)
  end

  def find_url(series_id, options = {})
    find_get_with_params(series_id, options).url
  end

  def find_get_with_params(series_id, options)
    get(find_path).params({ series_id: series_id }.merge(options))
  end

  def find_full(series_id, options = {})
    find_full_get_with_params(series_id, options).response(ThetvdbApi::Response::FullSeries)
  end

  def find_full_url(series_id, options = {})
    find_full_get_with_params(series_id, options).url
  end

  def find_full_get_with_params(series_id, options)
    get(find_full_path).params({ series_id: series_id }.merge(options))
  end

  private

  def find_path
    "#{series_uri}/{language}.xml"
  end

  def find_full_path
    "#{series_uri}/all/{language}.xml"
  end
end
