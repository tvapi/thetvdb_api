require 'happymapper'

class ThetvdbApi::Mappers::UpdateBanner
  include HappyMapper

  tag 'Banner'
  element :type, String
  element :format, String
  element :series_id, String, tag: 'Series'
  element :season_num, String, tag: 'SeasonNum'
  element :language, String
  element :path, String

  def url
    "http://thetvdb.com/banners/#{path}"
  end
end