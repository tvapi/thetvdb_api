class ThetvdbApi::Actor < ThetvdbApi::Base
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
    ':apikey/series/:series_id/actors.xml'
  end
end
