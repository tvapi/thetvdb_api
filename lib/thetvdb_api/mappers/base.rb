require 'happymapper'

class ThetvdbApi::Mappers::Base
  include HappyMapper

  element :id, Integer
  element :first_aired, Date, tag: 'FirstAired'
  element :imdb_id, String, tag: 'IMDB_ID'
  element :language, String, tag: 'Language'
  element :overview, String, tag: 'Overview'
  element :rating, Float, tag: 'Rating'
  element :rating_count, Integer, tag: 'RatingCount'
end
