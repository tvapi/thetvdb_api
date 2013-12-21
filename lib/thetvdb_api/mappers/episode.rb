require 'happymapper'
require 'base'

class ThetvdbApi::Mappers::Episode < ThetvdbApi::Mappers::Base
  tag 'Episode'

  element :combined_episode_number, Integer, tag: 'Combined_episodenumber'
  element :combined_season, Integer, tag: 'Combined_season'
  element :dvd_chapter, String, tag: 'DVD_chapter'
  element :dvd_discid, String, tag: 'DVD_discid'
  element :dvd_episodenumber, String, tag: 'DVD_episodenumber'
  element :dvd_season, String, tag: 'DVD_season'
  element :director, String, tag: 'Director'
  element :ep_img_flag, Integer, tag: 'EpImgFlag'
  element :name, String, tag: 'EpisodeName'
  element :number, String, tag: 'EpisodeNumber'
  element :guest_stars, String, tag: 'GuestStars'
  element :production_code, String, tag: 'ProductionCode'
  element :season_number, Integer, tag: 'SeasonNumber'
  element :writer, String, tag: 'Writer'
  element :absolute_number, Integer
  element :airs_after_season, Integer, tag: 'airsafter_season'
  element :airs_before_episode, Integer, tag: 'airsbefore_episode'
  element :airs_before_season, Integer, tag: 'airsbefore_season'
  element :filename, String
  element :last_updated_timestamp, Integer, tag: 'lastupdated'
  element :season_id, Integer, tag: 'seasonid'
  element :series_id, Integer, tag: 'seriesid'
  element :thumb_added_at, Time, tag: 'thumb_added'
  element :thumb_height, Integer
  element :thumb_width, Integer
end
