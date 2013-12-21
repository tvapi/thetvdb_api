require 'happymapper'
require 'thetvdb_api/mappers/actor'

class ThetvdbApi::Mappers::Actors
  include HappyMapper

  tag 'Actors'

  has_many :actors, ThetvdbApi::Mappers::Actor, tag: 'Actor'
end
