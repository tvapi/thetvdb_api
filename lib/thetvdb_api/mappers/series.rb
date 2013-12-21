require 'happymapper'
require 'thetvdb_api/mappers/base_mapper'

class ThetvdbApi::Mappers::Series
  include HappyMapper
  include ThetvdbApi::Mappers::BaseMapper

  tag 'Series'

  element :actors, String, tag: 'Actors'
  element :airs_day_of_week, String, tag: 'Airs_DayOfWeek'
  element :airs_time, String, tag: 'Airs_Time'
  element :content_rating, String, tag: 'ContentRating'
  element :genres, String, tag: 'Genre'
  element :network, String, targ: 'Network'
  element :network_id, Integer, targ: 'NetworkID'
  element :runtime, Integer, tag: 'Runtime'
  element :series_id, Integer, tag: 'SeriesID'
  element :name, String, tag: 'SeriesName'
  element :status, String, tag: 'Status'
  element :added_at, Time, tag: 'added'
  element :added_by, Integer, tag: 'adddedBy'
  element :banner_path, String, tag: 'banner'
  element :fanart_path, String, tag: 'fanart'
  element :last_updated_timestamp, Integer, tag: 'lastupdated'
  element :poster_path, String, tag: 'posters'
  element :zap2it_id, String

  def banner_url
    banner_path ? "http://thetvdb.com/banners/#{banner_path}" : nil
  end

  def fanart_url
    fanart_path ? "http://thetvdb.com/banners/#{fanart_path}" : nil
  end

  def poster_url
    poster_path ? "http://thetvdb.com/banners/#{poster_path}" : nil
  end
end
