require 'happymapper'

module ThetvdbApi::Mappers::BaseMapper
  def self.included(base)
    base.send :element, :id, Integer
    base.send :element, :first_aired, Date, tag: 'FirstAired'
    base.send :element, :imdb_id, String, tag: 'IMDB_ID'
    base.send :element, :language, String, tag: 'Language'
    base.send :element, :overview, String, tag: 'Overview'
    base.send :element, :rating, Float, tag: 'Rating'
    base.send :element, :rating_count, Integer, tag: 'RatingCount'
  end
end
