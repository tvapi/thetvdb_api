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

The generator will install an initializer where you must past your api_key, and can past: language (2 letters abbrevation).

## How to use

There is one entry point, in initialize you can past hash with api_key and language values, or leave empty:

```ruby
client = ThetvdbApi::Client.new(api_key: '...', language: 'en')
```

Search series by name

```ruby
client = ThetvdbApi::Client.new
client.search.get_series(options = {})
client.search.get_series_url(options = {}) # return only full url
client.search.get_series_by_remote_id(options = {})
client.search.get_series_by_remote_id_url(options = {}) # return only full url
client.search.get_episode(options = {})
client.search.get_episode_url(options = {}) # return only full url
```

Search series by id

```ruby
client = ThetvdbApi::Client.new
client.series.find(options = {})
client.series.find_url(options = {}) # return only full url
client.series.find_full(options = {})
client.series.find_full_url(options = {}) # return only full url
```

Return series actors

```ruby
client = ThetvdbApi::Client.new
client.actor.all(options = {})
client.actor.all_url(options = {}) # return only full url
```

Return series banners

```ruby
client = ThetvdbApi::Client.new
client.banner.all(options = {})
client.banner.all_url(options = {}) # return only full url
```

Return series episode

```ruby
client = ThetvdbApi::Client.new
client.episode.find_by_default_order(options = {})
client.episode.find_by_default_order_url(options = {}) # return only full url
client.episode.find_by_dvd_order(options = {})
client.episode.find_by_dvd_order_url(options = {}) # return only full url
client.episode.find_by_absolute_order(options = {})
client.episode.find_by_absolute_order_url(options = {}) # return only full url
client.episode.find(options = {})
client.episode.find_url(options = {}) # return only full url
```

Get updates

```ruby
client = ThetvdbApi::Client.new
client.update.day(options = {})
client.update.day_url(options = {}) # return only full url
client.update.week(options = {})
client.update.week_url(options = {}) # return only full url
client.update.month(options = {})
client.update.month_url(options = {}) # return only full url
client.update.all(options = {})
client.update.all_url(options = {}) # return only full url
```

ThetvdbApi default return response class with pure xml (in body method) string fetched by Faraday. You can pass

```ruby
mapping: true
```

options, and ThetvdbApi will return hash/array objects.

ThetvdbApi give you chance to write own mapper where mapping preformance could be better.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
