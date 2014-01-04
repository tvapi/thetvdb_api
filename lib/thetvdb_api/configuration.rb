require 'confiture'

class ThetvdbApi::Configuration
  include Confiture::Configuration

  confiture_allowed_keys(:api_key, :language, :adapter)
  confiture_defaults(language: 'en', adapter: :net_http)
end

ThetvdbApi::Configuration.configure