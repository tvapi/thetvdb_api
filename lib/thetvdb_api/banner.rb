class ThetvdbApi::Banner < ThetvdbApi::Base
  def find(options = {})
    find_path_with_params(options).get
  end

  def find_url(options = {})
    find_path_with_params(options).url
  end

  private

  def find_path_with_params(options)
    path(find_path).params(api_key_options.merge(options))
  end

  def find_path
    ':api_key/series/:series_id/banners.xml'
  end
end
