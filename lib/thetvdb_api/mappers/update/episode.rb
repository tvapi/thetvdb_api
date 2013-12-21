require 'happymapper'
require 'thetvdb_api/mappers/update/element'

class ThetvdbApi::Mappers::Update
  class Episode < ThetvdbApi::Mappers::Update::Element
    tag 'Episode'
  end
end
