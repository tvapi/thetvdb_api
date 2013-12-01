require 'confiture'

module ThetvdbApi
  class Configuration
    include Confiture::Configuration

    confiture_allowed_keys(:api_key, :language)
    confiture_defaults(language: 'en')

    def self.api_url
      'http://thetvdb.com/api/'
    end
  end
end
