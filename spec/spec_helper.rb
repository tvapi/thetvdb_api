require "coveralls"
Coveralls.wear!

require "awesome_print"
require "thetvdb_api"

Dir["spec/support/**/*.rb"].each { |f| require "./#{f}" }
