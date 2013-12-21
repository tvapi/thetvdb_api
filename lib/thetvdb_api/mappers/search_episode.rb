require 'happymapper'
require 'episode'

class ThetvdbApi::Mappers::SearchEpisode
  include HappyMapper

  tag 'Data'

  has_many :series, ThetvdbApi::Mappers::Episode, tag: 'Episode'
end
