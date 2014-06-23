class ThetvdbApi::Update < ThetvdbApi::Base
  def day
    day_path_with_params.get
  end

  def day_url
    day_path_with_params.url
  end

  def week
    week_path_with_params.get
  end

  def week_url
    week_path_with_params.url
  end

  def month
    month_path_with_params.get
  end

  def month_url
    month_path_with_params.url
  end

  def all
    all_path_with_params.get
  end

  def all_url
    all_path_with_params.url
  end

  private

  def day_path_with_params
    path(day_path).params(api_key_options)
  end

  def day_path
    ':api_key/updates/updates_day.xml'
  end

  def week_path_with_params
    path(week_path).params(api_key_options)
  end

  def week_path
    ':api_key/updates/updates_week.xml'
  end

  def month_path_with_params
    path(month_path).params(api_key_options)
  end

  def month_path
    ':api_key/updates/updates_month.xml'
  end

  def all_path_with_params
    path(all_path).params(api_key_options)
  end

  def all_path
    ':api_key/updates/updates_all.xml'
  end
end
