class ThetvdbApi::Update < ThetvdbApi::Base
  # Find update data.
  #
  # access: FREE
  # output: Faraday::Response instance with parsed XML string (example: http://thetvdb.com/wiki/index.php/API:Update_Records)
  def day
    day_path_with_params.get
  end

  # Find update data - url string.
  #
  # access: FREE
  # output: url string
  def day_url
    day_path_with_params.url
  end

  # Find update data.
  #
  # access: FREE
  # output: Faraday::Response instance with parsed XML string (example: http://thetvdb.com/wiki/index.php/API:Update_Records)
  def week
    week_path_with_params.get
  end

  # Find update data - url string.
  #
  # access: FREE
  # output: url string
  def week_url
    week_path_with_params.url
  end

  # Find update data.
  #
  # access: FREE
  # output: Faraday::Response instance with parsed XML string (example: http://thetvdb.com/wiki/index.php/API:Update_Records)
  def month
    month_path_with_params.get
  end

  # Find update data - url string.
  #
  # access: FREE
  # output: url string
  def month_url
    month_path_with_params.url
  end

  # Find update data.
  #
  # access: FREE
  # output: Faraday::Response instance with parsed XML string (example: http://thetvdb.com/wiki/index.php/API:Update_Records)
  def all
    all_path_with_params.get
  end

  # Find update data - url string.
  #
  # access: FREE
  # output: url string
  def all_url
    all_path_with_params.url
  end

  private

  def day_path_with_params
    path(day_path).params(api_key_options)
  end

  def day_path
    ':apikey/updates/updates_day.xml'
  end

  def week_path_with_params
    path(week_path).params(api_key_options)
  end

  def week_path
    ':apikey/updates/updates_week.xml'
  end

  def month_path_with_params
    path(month_path).params(api_key_options)
  end

  def month_path
    ':apikey/updates/updates_month.xml'
  end

  def all_path_with_params
    path(all_path).params(api_key_options)
  end

  def all_path
    ':apikey/updates/updates_all.xml'
  end
end
