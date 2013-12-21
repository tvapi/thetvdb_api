require 'happymapper'

class ThetvdbApi::Mappers::Update
  class Series
    include HappyMapper

    tag 'Series'

    element :id, Integer
    element :timestamp, Integer, tag: 'time'
  end
end