module ThetvdbApi
  module Request
    module Module; end
  end
end

require 'thetvdb_api/version'
require 'thetvdb_api/configuration'
require 'thetvdb_api/request/base'
require 'thetvdb_api/request/module/find'
require 'thetvdb_api/request/module/series_uri'
require 'thetvdb_api/request/search'
require 'thetvdb_api/request/update'
require 'thetvdb_api/request/series'
require 'thetvdb_api/request/episode'
require 'thetvdb_api/request/actor'
require 'thetvdb_api/request/banner'
