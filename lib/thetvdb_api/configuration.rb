require 'confiture'

class ThetvdbApi::Configuration
  include Confiture::Configuration

  confiture_allowed_keys(:api_key, :language)
  confiture_defaults(language: 'en')
end
