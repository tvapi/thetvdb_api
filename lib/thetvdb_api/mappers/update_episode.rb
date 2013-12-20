require 'happymapper'

class ThetvdbApi::Mappers::UpdateEpisode
  include HappyMapper

  tag 'Episode'

  element :id, Integer
  element :timestamp, Integer, tag: 'time'
end