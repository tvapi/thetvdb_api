require 'happymapper'
require 'search_series/series'

class ThetvdbApi::Mappers::SearchSeries
  include HappyMapper

  tag 'Data'

  has_many :series, ThetvdbApi::Mappers::SearchSeries::Series, tag: 'Series'
end
