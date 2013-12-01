require 'hashie'

module ThetvdbApi
  class Series < Hashie::Mash
    include Hashie::Extensions::MethodAccess
    include Hashie::Extensions::KeyReplace
    include Hashie::Extensions::Coercion

    replace_key :added, :added_at
    replace_key :lastupdated, :last_updated_at
    replace_key :seriesid, :series_id

    coerce_key :id, Integer
    coerce_key :actors, Array
    coerce_key :added_at, Time
    coerce_key :added_by, Integer
    coerce_key :alias_names, Array
    coerce_key :first_aired, Date
    coerce_key :genre, Array
    coerce_key :last_updated_at, Time
    coerce_key :network_id, Integer
    coerce_key :rating, Float
    coerce_key :rating_count, Integer
    coerce_key :runtime, Integer
    coerce_key :series_id, Integer
  end
end
