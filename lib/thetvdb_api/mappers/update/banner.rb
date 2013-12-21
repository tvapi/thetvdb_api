require 'happymapper'

class ThetvdbApi::Mappers::Update
  class Banner
    include HappyMapper

    tag 'Banner'
    element :type, String
    element :format, String
    element :series_id, String, tag: 'Series'
    element :season_num, String, tag: 'SeasonNum'
    element :language, String
    element :path, String

    def url
      path ? "http://thetvdb.com/banners/#{path}" : nil
    end
  end
end
