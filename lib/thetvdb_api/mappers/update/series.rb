require 'happymapper'
require 'thetvdb_api/mappers/update/element'

class ThetvdbApi::Mappers::Update
  class Series < ThetvdbApi::Mappers::Update::Element
    tag 'Series'
  end
end
