require 'hashie'

class ThetvdbApi::Base < Hashie::Mash
  include Hashie::Extensions::MethodAccess
  include Hashie::Extensions::Coercion
end
