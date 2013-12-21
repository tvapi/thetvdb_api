require 'happymapper'

class ThetvdbApi::Mappers::Update
  class Episode
    include HappyMapper

    tag 'Episode'

    element :id, Integer
    element :timestamp, Integer, tag: 'time'
  end
end