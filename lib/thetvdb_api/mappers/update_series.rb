require 'happymapper'

class ThetvdbApi::Mappers::UpdateSeries
  include HappyMapper

  tag 'Series'

  element :id, Integer
  element :timestamp, Integer, tag: 'time'
end