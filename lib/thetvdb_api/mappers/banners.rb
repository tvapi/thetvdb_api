require 'happymapper'
require 'thetvdb_api/mappers/banner'

class ThetvdbApi::Mappers::Banners
  include HappyMapper

  tag 'Banners'

  has_many :banners, ThetvdbApi::Mappers::Banner, tag: 'Banner'
end
