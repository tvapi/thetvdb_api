class ThetvdbApi::Update < ThetvdbApi::Base
  def day(options = {})
    get(day_path).params(options).response
  end

  def day_url
    get(day_path).url
  end

  def week(options = {})
    get(week_path).params(options).response
  end

  def week_url
    get(week_path).url
  end

  def month(options = {})
    get(month_path).params(options).response
  end

  def month_url
    get(month_path).url
  end

  def all(options = {})
    get(all_path).params(options).response
  end

  def all_url
    get(all_path).url
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
