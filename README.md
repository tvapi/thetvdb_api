[![Build Status](https://travis-ci.org/wafcio/thetvdb_api.png?branch=master)](https://travis-ci.org/wafcio/thetvdb_api)
[![Dependency Status](https://gemnasium.com/wafcio/thetvdb_api.png)](https://gemnasium.com/wafcio/thetvdb_api)
[![Code Climate](https://codeclimate.com/github/wafcio/thetvdb_api.png)](https://codeclimate.com/github/wafcio/thetvdb_api)
[![Coverage Status](https://coveralls.io/repos/wafcio/thetvdb_api/badge.png)](https://coveralls.io/r/wafcio/thetvdb_api)
[![Gem Version](https://badge.fury.io/rb/thetvdb_api.png)](http://badge.fury.io/rb/thetvdb_api)

# ThetvdbApi

thetvdb_api is a simple ruby client for accessing TV shows information from the thetvdb.com API.

## Getting started

You can add it to your Gemfile with:

```ruby
gem 'thetvdb_api'
```

Run the bundle command to install it.

After you install ThetvdbApi and add it to your Gemfile, you need to run the generator (if you use Ruby on Rails application):

```console
rails generate thetvdb_api:install
```

The generator will install an initializer where you must past your api_key, and can past: language (2 letters abbrevation), api_url (base url).

## How to use

There is one entry point, in initialize you can past hash with api_key, language and api_url values, or leave empty:

```ruby
client = ThetvdbApi::Client.new(api_url: '...', api_key: '...', language: 'en')
```

Search series by name

```ruby
client = ThetvdbApi::Client.new
client.search.get_series('buffy')
client.search.get_series_by_imdb_id('...')
client.search.get_series_by_zap2it_id('...')
client.search.get_episode_by_air_date('123', air_date)
```

Search series by id

```ruby
client = ThetvdbApi::Client.new
client.series.find('123')
client.series.find_full('123')
```

Return series actors

```ruby
client = ThetvdbApi::Client.new
client.actor.all(series_id)
```

Return series banners

```ruby
client = ThetvdbApi::Client.new
client.banner.all(series_id)
```

Return series episode

```ruby
client = ThetvdbApi::Client.new
client.episode.find_by_default_order(series_id, season, episode)
client.episode.find_by_dvd_order(series_id, season, episode)
client.episode.find_by_absolute_order(series_id, absolute)
client.episode.find(episode_id)
```

Get updates

```ruby
client = ThetvdbApi::Client.new
client.update.day
client.update.week
client.update.month
client.update.all
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
