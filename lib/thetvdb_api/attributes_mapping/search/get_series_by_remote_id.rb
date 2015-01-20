require 'hashie'

class ThetvdbApi::AttributesMapping::Search::GetSeriesByRemoteId < Hashie::Trash
  property :imdbid, from: :imdb_id
  property :zap2it, from: :zap2it_id
  property :language
end