class ThetvdbApi::Series < ThetvdbApi::Base
  def find(options = {})
    find_path_with_params(options).get
  end

  def find_url(options = {})
    find_path_with_params(options).url
  end

  def find_full(options = {})
    find_full_path_with_params(options).get
  end

  def find_full_url(options = {})
    find_full_path_with_params(options).url
  end

  private

  def find_path_with_params(options)
    path(find_path).params(api_key_with_language_options.merge(options))
  end

  def find_path
    ':api_key/series/:series_id/:language.xml'
  end

  def find_full_path_with_params(options)
    path(find_full_path).params(api_key_with_language_options.merge(options))
  end

  def find_full_path
    ':api_key/series/:series_id/all/:language.xml'
  end
end
