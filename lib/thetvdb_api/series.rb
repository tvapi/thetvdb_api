class ThetvdbApi::Series < ThetvdbApi::Base
  include Ov

  # Find the series data by series id.
  #
  # access: FREE
  # param:
  #   find(1234)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Series_Record
  let :find, Any do |id|
    find(id: id)
  end

  # Find the series data by series id.
  #
  # access: FREE
  # param:
  #   find(1234, 'de')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Series_Record
  let :find, Any, String do |id, language|
    find(id: id, language: language)
  end

  # Find the series data by series id.
  #
  # access: FREE
  # param:
  #   find(id: 1234)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Base_Series_Record
  let :find, Hash do |options|
    find_path_with_params(options).get
  end

  # Find the series data by series id - return only url.
  #
  # access: FREE
  # param:
  #   find_url(1234)
  # output: url string
  let :find_url, Any do |id|
    find_url(id: id)
  end

  # Find the series data by series id - return only url.
  #
  # access: FREE
  # param:
  #   find_url(1234, 'de')
  # output: url string
  let :find_url, Any, String do |id, language|
    find_url(id: id, language: language)
  end

  # Find the series data by series id - return only url.
  #
  # access: FREE
  # param:
  #   find_url(id: 1234)
  # output: url string
  let :find_url, Hash do |options|
    find_path_with_params(options).url
  end

  # Find the full series data by series id.
  #
  # access: FREE
  # param:
  #   find_full(1234)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Full_Series_Record
  let :find_full, Any do |id|
    find_full(id: id)
  end

  # Find the full series data by series id.
  #
  # access: FREE
  # param:
  #   find_full(1234, 'de')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Full_Series_Record
  let :find_full, Any, String do |id, language|
    find_full(id: id, language: language)
  end

  # Find the full series data by series id.
  #
  # access: FREE
  # param:
  #   find_full(id: 1234)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:Full_Series_Record
  let :find_full, Hash do |options|
    find_full_path_with_params(options).get
  end

  # Find the series data by series id - return only url.
  #
  # access: FREE
  # param:
  #   find_full_url(1234)
  # output: url string
  let :find_full_url, Any do |id|
    find_full_url(id: id)
  end

  # Find the series data by series id - return only url.
  #
  # access: FREE
  # param:
  #   find_full_url(1234, 'de')
  # output: url string
  let :find_full_url, Any, String do |id, language|
    find_full_url(id: id, language: language)
  end

  # Find the series data by series id - return only url.
  #
  # access: FREE
  # param:
  #   find_full_url(id: 1234)
  # output: url string
  let :find_full_url, Hash do |options|
    find_full_path_with_params(options).url
  end

  private

  def find_path_with_params(options)
    path(find_path).params(api_key_with_language_options.merge(options))
  end

  def find_path
    ':apikey/series/:id/:language.xml'
  end

  def find_full_path_with_params(options)
    path(find_full_path).params(api_key_with_language_options.merge(options))
  end

  def find_full_path
    ':apikey/series/:id/all/:language.xml'
  end
end
