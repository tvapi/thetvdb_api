require 'faraday'
require 'uri_template'
require 'service_api'

class ThetvdbApi::Base
  include ServiceApi::BaseFaraday

  def series_uri
    '{api_key}/series/{series_id}'
  end

  private

  def base_url
    'http://thetvdb.com/api/'
  end
end
