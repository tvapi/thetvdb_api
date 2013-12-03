module ThetvdbApi
  class Actor < ThetvdbApi::Base
    coerce_key :id, Integer
    coerce_key :sort_order, Integer
  end
end
