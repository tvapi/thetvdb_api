[![Build Status](https://travis-ci.org/wafcio/thetvdb_api.png?branch=master)](https://travis-ci.org/wafcio/thetvdb_api)
[![Dependency Status](https://gemnasium.com/wafcio/thetvdb_api.png)](https://gemnasium.com/wafcio/thetvdb_api)
[![Code Climate](https://codeclimate.com/github/wafcio/thetvdb_api.png)](https://codeclimate.com/github/wafcio/thetvdb_api)
[![Coverage Status](https://coveralls.io/repos/wafcio/thetvdb_api/badge.png)](https://coveralls.io/r/wafcio/thetvdb_api)
[![Gem Version](https://badge.fury.io/rb/thetvdb_api.png)](http://badge.fury.io/rb/thetvdb_api)

# ThetvdbApi

thetvdb_api is a simple ruby client for accessing TV shows information from the thetvdb.com API.

## Installation

With Bundler:

```ruby
gem 'thetvdb_api'
```

```ruby
$ bundle install
```

Otherwhise:

```ruby
gem install thetvdb_api
```

## How to use

You have two way for access to api:

* I case (create client class, one entry point)

Language attribute is optional with default value 'en'

```ruby
client = ThetvdbApi::Client.new(api_key: '...', language: 'en')
client.actor # => #<ThetvdbApi::Actor>
client.banner # => #<ThetvdbApi::Banner>
client.episode # => #<ThetvdbApi::Episode>
client.search # => #<ThetvdbApi::Search>
client.series # => #<ThetvdbApi::Series>
client.update # => #<ThetvdbApi::Update>
client.server_time # => #<ThetvdbApi::ServerTime>
```

* II case (direct access to api class, many entry points)

Language attribute is required

```ruby
ThetvdbApi::Actor.new(api_key: '...', language: 'en')
ThetvdbApi::Banner.new(api_key: '...', language: 'en')
ThetvdbApi::Episode.new(api_key: '...', language: 'en')
ThetvdbApi::Search.new(api_key: '...', language: 'en')
ThetvdbApi::Series.new(api_key: '...', language: 'en')
ThetvdbApi::Update.new(api_key: '...', language: 'en')
ThetvdbApi::ServerTime.new(api_key: '...', language: 'en')
```

## Methods

For almost all method you can pass hash attributes or multiple attributes specified in method comment (except some methods in Search class).

### Actor methods

For method attributes read https://github.com/wafcio/thetvdb_api/blob/master/lib/thetvdb_api/actor.rb

* all
* all_url

### Banner methods

For method attributes read https://github.com/wafcio/thetvdb_api/blob/master/lib/thetvdb_api/banner.rb

* all
* all_url

### Episode methods

For method attributes read https://github.com/wafcio/thetvdb_api/blob/master/lib/thetvdb_api/episode.rb

* find
* find_url
* find_by_absolute_order
* find_by_absolute_order_url
* find_by_default_order
* find_by_default_order_url
* find_by_dvd_order
* find_by_dvd_order_url

### Search methods

For method attributes read https://github.com/wafcio/thetvdb_api/blob/master/lib/thetvdb_api/search.rb

* get_series
* get_series_url
* get_series_by_remote
* get_series_by_remote_url
* get_series_by_imdb_id
* get_series_by_imdb_id_url
* get_series_by_zap2it_id
* get_series_by_zap2it_id_url
* get_episode
* get_episode_url

### Series methods

For method attributes read https://github.com/wafcio/thetvdb_api/blob/master/lib/thetvdb_api/series.rb

* find
* find_url
* find_full
* find_full_url


### Server Time method

For method attributes read https://github.com/wafcio/thetvdb_api/blob/master/lib/thetvdb_api/server_time.rb

* find

### Update methods

* day
* day_url
* week
* week_url
* month
* month_url
* all
* all_url

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
