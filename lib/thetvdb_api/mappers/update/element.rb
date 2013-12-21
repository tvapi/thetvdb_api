require 'happymapper'

class ThetvdbApi::Mappers::Update
  class Element
    include HappyMapper

    element :id, Integer
    element :timestamp, Integer, tag: 'time'
  end
end
