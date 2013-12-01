require 'hashie'

module ThetvdbApi
  class Actor < Hashie::Mash
    include Hashie::Extensions::MethodAccess
    include Hashie::Extensions::KeyReplace
    include Hashie::Extensions::Coercion

    coerce_key :id, Integer
    coerce_key :sort_order, Integer
  end
end
