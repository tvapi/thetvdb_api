class ThetvdbApi::ServerTime < ThetvdbApi::Base
  # Returns server time.
  #
  # access: FREE

  def find
    find_path_with_params.get
  end

  private

  def find_path_with_params
    path(find_path)
  end

  def find_path
    'Updates.php?type=none'
  end

end