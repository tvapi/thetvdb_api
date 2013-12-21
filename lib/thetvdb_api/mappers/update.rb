require 'happymapper'
require 'update_banner'
require 'update_episode'
require 'update_series'

class ThetvdbApi::Mappers::Update
  include HappyMapper

  tag 'Data'

  has_many :series, ThetvdbApi::Mappers::UpdateSeries, tag: 'Series'
  has_many :episodes, ThetvdbApi::Mappers::UpdateEpisode, tag: 'Episode'
  has_many :banners, ThetvdbApi::Mappers::UpdateBanner, tag: 'Banner'
end