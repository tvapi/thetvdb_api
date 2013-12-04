class ThetvdbApi::Actor < ThetvdbApi::Base
  coerce_key :id, Integer
  coerce_key :sort_order, Integer
end
