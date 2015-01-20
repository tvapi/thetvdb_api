require 'hashie'

class ThetvdbApi::AttributesMapping::Search::GetSeries < Hashie::Trash
  property :seriesname, from: :name
  property :language
end