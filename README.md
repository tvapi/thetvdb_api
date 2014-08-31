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

I solution (create client class, one entry point)

```ruby
client = ThetvdbApi::Client.new(api_key: '...', language: 'en')
client.search...
client.series...
client.actor...
client.banner...
client.episode...
client.update...
```

II solution (direct access to api class, many entry points)

```ruby
search = ThetvdbApi::Search.new(api_key: '...', language: 'en')
search...
```
```ruby
series = ThetvdbApi::Series.new(api_key: '...', language: 'en')
series...
```
```ruby
actor = ThetvdbApi::Actor.new(api_key: '...', language: 'en')
actor...
```
```ruby
banner = ThetvdbApi::Banner.new(api_key: '...', language: 'en')
banner...
```
```ruby
episode = ThetvdbApi::Episode.new(api_key: '...', language: 'en')
episode...
```
```ruby
update = ThetvdbApi::update.new(api_key: '...', language: 'en')
update...
```

Search series (by name) methods - access by search method or Search class

```ruby
get_series(options = {})
get_series_url(options = {}) # return only full url
get_series_by_remote_id(options = {})
get_series_by_remote_id_url(options = {}) # return only full url
get_episode(options = {})
get_episode_url(options = {}) # return only full url
```

Search series (by id) methods - access by series method or Series class

```ruby
find(options = {})
find_url(options = {}) # return only full url
find_full(options = {})
find_full_url(options = {}) # return only full url
```

Return series actors - access by actor method or Actor class

```ruby
all(options = {})
all_url(options = {}) # return only full url
```

Return series banners - access by banner method or Banner class

```ruby
all(options = {})
all_url(options = {}) # return only full url
```

Return series episode - access by episode method or Episode class

```ruby
find_by_default_order(options = {})
find_by_default_order_url(options = {}) # return only full url
find_by_dvd_order(options = {})
find_by_dvd_order_url(options = {}) # return only full url
find_by_absolute_order(options = {})
find_by_absolute_order_url(options = {}) # return only full url
find(options = {})
find_url(options = {}) # return only full url
```

Get updates - access by update method or Update class

```ruby
day
day_url # return only full url
week
week_url # return only full url
month
month_url # return only full url
all
all_url # return only full url
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
