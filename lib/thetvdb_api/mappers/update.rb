require 'happymapper'
require 'update/banner'
require 'update/episode'
require 'update/series'

class ThetvdbApi::Mappers::Update
  include HappyMapper

  tag 'Data'

  has_many :series, ThetvdbApi::Mappers::Update::Series, tag: 'Series'
  has_many :episodes, ThetvdbApi::Mappers::Update::Episode, tag: 'Episode'
  has_many :banners, ThetvdbApi::Mappers::Update::Banner, tag: 'Banner'
end
