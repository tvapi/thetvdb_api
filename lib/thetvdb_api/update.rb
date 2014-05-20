class ThetvdbApi::Update < ThetvdbApi::Base
  def day(options = {})
    day_path_with_params(options).get
  end

  def day_url
    day_path_with_params.url
  end

  def day_path_with_params(options = {})
    path(day_path).params(options.merge(api_key: @client.options[:api_key]))
  end

  def week(options = {})
    week_path_with_params(options).get
  end

  def week_url
    week_path_with_params.url
  end

  def week_path_with_params(options = {})
    path(week_path).params(options.merge(api_key: @client.options[:api_key]))
  end

  def month(options = {})
    month_path_with_params(options).get
  end

  def month_url
    month_path_with_params.url
  end

  def month_path_with_params(options = {})
    path(month_path).params(options.merge(api_key: @client.options[:api_key]))
  end

  def all(options = {})
    all_path_with_params(options).get
  end

  def all_url
    all_path_with_params.url
  end

  def all_path_with_params(options = {})
    path(all_path).params(options.merge(api_key: @client.options[:api_key]))
  end

  private

  def day_path
    '{api_key}/updates/updates_day.xml'
  end

  def week_path
    '{api_key}/updates/updates_week.xml'
  end

  def month_path
    '{api_key}/updates/updates_month.xml'
  end

  def all_path
    '{api_key}/updates/updates_all.xml'
  end
end
