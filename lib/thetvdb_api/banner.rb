module ThetvdbApi
  class Banner < ThetvdbApi::Base
    coerce_key :rating, Float
    coerce_key :rating_count, Integer
  end
end
