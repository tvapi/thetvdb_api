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
```

### Actor methods

* all(series_id: 123)
* all_url(series_id: 123)

### Banner methods

* all(series_id: 123)
* all_url(series_id: 123)

### Episode methods

* find(episode_id: 123)
* find_url(episode_id: 123)
* find_by_absolute_order(series_id: 123, absolute: 1)
* find_by_absolute_order_url(series_id: 123, absolute: 1)
* find_by_default_order(series_id: 123, season: 1, episode: 1)
* find_by_default_order_url(series_id: 123, season: 1, episode: 1)
* find_by_dvd_order(series_id: 123, season: 1, episode: 1)
* find_by_dvd_order_url(series_id: 123, season: 1, episode: 1)

### Search methods

* get_series(seriesname: 123)
* get_series_url(seriesname: 123)
* get_series_by_remote(imdbid: 'tt0000111')
* get_series_by_remote_url(imdbid: 'tt0000111')
* get_series_by_remote(zap2itid: 'SH000000000123')
* get_series_by_remote_url(zap2itid: 'SH000000000123')
* get_episode(seriesid: 123, airdate: '2000-01-01')
* get_episode_url(seriesid: 123, airdate: '2000-01-01')

### Series methods

* find(series_id: 123)
* find_url(series_id: 123)
* find_full(series_id: 123)
* find_full_url(series_id: 123)

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
