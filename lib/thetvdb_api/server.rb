class ThetvdbApi::Server < ThetvdbApi::Base
  # Returns server time.
  #
  # access: FREE
  # output: Faraday::Response instance with parsed XML string

  def time
    path(find_path).get
  end

  private
  
  def find_path
    'Updates.php?type=none'
  end

end