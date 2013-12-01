require 'hashie'

module ThetvdbApi
  class Episode < Hashie::Mash
    include Hashie::Extensions::MethodAccess
    include Hashie::Extensions::KeyReplace
    include Hashie::Extensions::Coercion

    replace_key :airsafter_season, :airs_after_season
    replace_key :airsbefore_episode, :airs_before_episode
    replace_key :airsbefore_season, :airs_before_season
    replace_key :Combined_episodenumber, :combined_episode_number
    replace_key :DVD_discid, :dvd_disc_id
    replace_key :DVD_episodenumber, :dvd_episode_number
    replace_key :lastupdated, :last_updated_at
    replace_key :seasonid, :season_id
    replace_key :seriesid, :series_id
    replace_key :thumb_added, :thumb_added_at

    coerce_key :id, Integer
    coerce_key :absolute_number, Integer
    coerce_key :combined_episode_number, Integer
    coerce_key :combined_season, Integer
    coerce_key :director, Array
    coerce_key :ep_img_flag, Integer
    coerce_key :episode_number, Integer
    coerce_key :first_aired, Date
    coerce_key :guest_stars, Array
    coerce_key :last_updated_at, Time
    coerce_key :rating, Float
    coerce_key :rating_count, Integer
    coerce_key :season_id, Integer
    coerce_key :season_number, Integer
    coerce_key :series_id, Integer
    coerce_key :thumb_added_at, Time
    coerce_key :thumb_height, Integer
    coerce_key :thumb_width, Integer
    coerce_key :writer, Array
  end
end
