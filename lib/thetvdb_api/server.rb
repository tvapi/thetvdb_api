class ThetvdbApi::Server < ThetvdbApi::Base
  # Server time.
  #
  # access: FREE
  # output: Faraday::Response instance with parsed XML string
  def time
    get(time_path)
  end

  # Server time.
  #
  # access: FREE
  # output: url string
  def time_url
    base_url + time_path
  end

  private
  
  def time_path
    "Updates.php?type=none"
  end
end
