class ThetvdbApi::Search < ThetvdbApi::Base
  def get_series(options = {})
    get_series_path_with_params(options).get
  end

  def get_series_url(options = {})
    get_series_path_with_params(options).url
  end

  def get_series_path_with_params(options)
    path(get_series_path).params({ language: @client.options[:language] }.merge(options))
  end

  def get_series_by_remote_id(options = {})
    get_series_by_remote_id_path_with_params(options).get
  end

  def get_series_by_remote_id_url(options = {})
    get_series_by_remote_id_path_with_params(options).url
  end

  def get_series_by_remote_id_path_with_params(options)
    path(get_series_by_remote_id_path).params(language_options.merge(options))
  end

  def get_episode(options = {})
    get_episode_path_with_params(options).get
  end

  def get_episode_url(options = {})
    get_episode_path_with_params(options).url
  end

  def get_episode_path_with_params(options)
    path(get_episode_path).params(language_options.merge(options))
  end

  private

  def get_series_path
    'GetSeries.php'
  end

  def get_series_by_remote_id_path
    'GetSeriesByRemoteID.php'
  end

  def get_episode_path
    'GetEpisodeByAirDate.php'
  end
end
