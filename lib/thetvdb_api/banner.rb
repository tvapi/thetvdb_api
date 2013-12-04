module ThetvdbApi
  class Banner < ThetvdbApi::Base
    replace_key :Series, :series_id

    coerce_key :id, Integer
    coerce_key :rating, Float
    coerce_key :rating_count, Integer
    coerce_key :season, Integer
    coerce_key :series_id, Integer
    coerce_key :season_num, Integer
    coerce_key :time, Time
  end
end
