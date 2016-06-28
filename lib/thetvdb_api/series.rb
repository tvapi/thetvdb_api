class ThetvdbApi::Series < ThetvdbApi::Base
  # Find the series data by series id.
  #
  # access: FREE
  # param:
  #   find(id: 1234)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Series_Record
  def find(id:, language:)
    get(find_path(id: id, language: language))
  end

  # Find the series data by series id - return only url.
  #
  # access: FREE
  # param:
  #   find_url(id: 1234)
  # output: url string
  def find_url(id:, language:)
    base_url + find_path(id: id, language: language)
  end

  # Find the full series data by series id.
  #
  # access: FREE
  # param:
  #   find_full(id: 1234)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Full_Series_Record
  def find_full(id:, language:)
    get(find_full_path(id: id, language: language))
  end

  # Find the series data by series id - return only url.
  #
  # access: FREE
  # param:
  #   find_full_url(id: 1234)
  # output: url string
  def find_full_url(id:, language:)
    base_url + find_full_path(id: id, language: language)
  end

  private

  def find_path(id:, language:)
    "#{options[:api_key]}/series/#{id}/#{language}.xml"
  end

  def find_full_path(id:, language:)
    "#{options[:api_key]}/series/#{id}/all/#{language}.xml"
  end
end
