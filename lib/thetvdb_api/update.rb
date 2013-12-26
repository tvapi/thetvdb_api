class ThetvdbApi::Update < ThetvdbApi::Base
  def day(options = {})
    day_get_with_params(options).response(ThetvdbApi::Response::Update)
  end

  def day_url
    day_get_with_params.url
  end

  def day_get_with_params(options = {})
    get(day_path).params(options)
  end

  def week(options = {})
    week_get_with_params(options).response(ThetvdbApi::Response::Update)
  end

  def week_url
    week_get_with_params.url
  end

  def week_get_with_params(options = {})
    get(week_path).params(options)
  end

  def month(options = {})
    month_get_with_params(options).response(ThetvdbApi::Response::Update)
  end

  def month_url
    month_get_with_params.url
  end

  def month_get_with_params(options = {})
    get(month_path).params(options)
  end

  def all(options = {})
    all_get_with_params(options).response(ThetvdbApi::Response::Update)
  end

  def all_url
    all_get_with_params.url
  end

  def all_get_with_params(options = {})
    get(all_path).params(options)
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
