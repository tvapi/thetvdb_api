require 'happymapper'

class ThetvdbApi::Mappers::SearchSeries
  class Series
    include HappyMapper

    tag 'Series'

    element :id, Integer
    element :series_id, Integer, tag: 'seriesid'
    element :language, String
    element :name, String, tag: 'SeriesName'
    element :aliases, String, tag: 'AliasNames'
    element :banner_path, String, tag: 'banner'
    element :overview, String, tag: 'Overview'
    element :first_aired, Date
    element :imdb_id, String, tag: 'IMDB_ID'
    element :zap2it_id, String
    element :network, String, tag: 'Network'

    def banner_url
      banner_path ? "http://thetvdb.com/banners/#{banner_path}" : nil
    end
  end
end
