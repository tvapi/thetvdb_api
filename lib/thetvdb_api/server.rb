class ThetvdbApi::Server < ThetvdbApi::Base
  # Server time.
  #
  # access: FREE
  # output: Faraday::Response instance with parsed XML string
  def time
    get(time_path, time_params)
  end

  # Server time.
  #
  # access: FREE
  # output: url string
  def time_url
    base_url + time_path + build_query(time_params)
  end

  private

  def time_path
    "Updates.php"
  end

  def time_params
    { type: "none" }
  end
end
