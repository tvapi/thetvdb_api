require 'coveralls'
Coveralls.wear!

require 'thetvdb_api'

Dir['spec/support/**/*.rb'].each { |f| require "./#{f}" }
