class ThetvdbApi::Update < ThetvdbApi::Base
  def day
    get('{api_key}/updates/updates_day.xml').response
  end

  def week
    get('{api_key}/updates/updates_week.xml').response
  end

  def month
    get('{api_key}/updates/updates_month.xml').response
  end

  def all
    get('{api_key}/updates/updates_all.xml').response
  end
end
