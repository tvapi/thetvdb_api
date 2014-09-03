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

## How to use

You have two way for access to api:

* I way (create client class, one entry point)

In this case language attribute is optional with default value 'en'

* II way (direct access to api class, many entry points)

In this case language attribute is required

Search series (by name) methods - access by search method or Search class

```ruby
client = ThetvdbApi::Client.new(api_key: '...', language: 'en')
client.search.get_series(options = {})
client.search.get_series_url(options = {}) # return only full url
client.search.get_series_by_remote_id(options = {})
client.search.get_series_by_remote_id_url(options = {}) # return only full url
client.search.get_episode(options = {})
client.search.get_episode_url(options = {}) # return only full url
```

```ruby
search = ThetvdbApi::Search.new(api_key: '...', language: 'en')
search.get_series(options = {})
search.get_series_url(options = {}) # return only full url
search.get_series_by_remote_id(options = {})
search.get_series_by_remote_id_url(options = {}) # return only full url
search.get_episode(options = {})
search.get_episode_url(options = {}) # return only full url
```

Search series (by id) methods - access by series method or Series class

```ruby
client = ThetvdbApi::Client.new(api_key: '...', language: 'en')
client.series.find(options = {})
client.series.find_url(options = {}) # return only full url
client.series.find_full(options = {})
client.series.find_full_url(options = {}) # return only full url
```

```ruby
client = ThetvdbApi::Series.new(api_key: '...', language: 'en')
series.find(options = {})
series.find_url(options = {}) # return only full url
series.find_full(options = {})
series.find_full_url(options = {}) # return only full url
```

Return series actors - access by actor method or Actor class

```ruby
client = ThetvdbApi::Client.new(api_key: '...', language: 'en')
client.actor.all(options = {})
client.actor.all_url(options = {}) # return only full url
```

```ruby
actor = ThetvdbApi::Actor.new(api_key: '...', language: 'en')
actor.all(options = {})
actor.all_url(options = {}) # return only full url
```

Return series banners - access by banner method or Banner class

```ruby
client = ThetvdbApi::Client.new(api_key: '...', language: 'en')
client.banner.all(options = {})
client.banner.all_url(options = {}) # return only full url
```

```ruby
banner = ThetvdbApi::Banner.new(api_key: '...', language: 'en')
banner.all(options = {})
banner.all_url(options = {}) # return only full url
```

Return series episode - access by episode method or Episode class

```ruby
client = ThetvdbApi::Client.new(api_key: '...', language: 'en')
client.episode.find_by_default_order(options = {})
client.episode.find_by_default_order_url(options = {}) # return only full url
client.episode.find_by_dvd_order(options = {})
client.episode.find_by_dvd_order_url(options = {}) # return only full url
client.episode.find_by_absolute_order(options = {})
client.episode.find_by_absolute_order_url(options = {}) # return only full url
client.episode.find(options = {})
client.episode.find_url(options = {}) # return only full url
```

```ruby
episode = ThetvdbApi::Episode.new(api_key: '...', language: 'en')
episode.find_by_default_order(options = {})
episode.find_by_default_order_url(options = {}) # return only full url
episode.find_by_dvd_order(options = {})
episode.find_by_dvd_order_url(options = {}) # return only full url
episode.find_by_absolute_order(options = {})
episode.find_by_absolute_order_url(options = {}) # return only full url
episode.find(options = {})
episode.find_url(options = {}) # return only full url
```

Get updates - access by update method or Update class

```ruby
client = ThetvdbApi::Client.new(api_key: '...', language: 'en')
client.update.day
client.update.day_url # return only full url
client.update.week
client.update.week_url # return only full url
client.update.month
client.update.month_url # return only full url
client.update.all
client.update.all_url # return only full url
```

```ruby
update = ThetvdbApi::Update.new(api_key: '...', language: 'en')
update.day
update.day_url # return only full url
update.week
update.week_url # return only full url
update.month
update.month_url # return only full url
update.all
update.all_url # return only full url
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
