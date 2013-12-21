require 'happymapper'
require 'thetvdb_api/mappers/episode'
require 'thetvdb_api/mappers/series'

class ThetvdbApi::Mappers::FullSeries
  include HappyMapper

  tag 'Data'

  element :series, ThetvdbApi::Mappers::Series, tag: 'Series'
  has_many :episodes, ThetvdbApi::Mappers::Episode, tag: 'Episodes'
end
