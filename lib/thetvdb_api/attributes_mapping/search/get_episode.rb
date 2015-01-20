require 'hashie'

class ThetvdbApi::AttributesMapping::Search::GetEpisode < Hashie::Trash
  property :seriesid, from: :series_id
  property :airdate, from: :air_date
end