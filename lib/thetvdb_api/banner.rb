require 'hashie'

module ThetvdbApi
  class Banner < Hashie::Mash
    include Hashie::Extensions::MethodAccess
    include Hashie::Extensions::KeyReplace
    include Hashie::Extensions::Coercion

    coerce_key :rating, Float
    coerce_key :rating_count, Integer
  end
end
