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

After you install Devise and add it to your Gemfile, you need to run the generator:

```console
rails generate thetvdb_api:install
```

The generator will install an initializer where you must past your API KEY.

## How to use

All request class return instance where result method contain object or collection.

For example:
```console
series = ThetvdbApi::Request::Series.find('buffy')
series.result
=> #<ThetvdbApi::Series ...>
```

* ThetvdbApi::Request::Actor.all(series_id) - return all banners for specific series
* ThetvdbApi::Request::Banner.all(series_id) - return all banners for specific series
* ThetvdbApi::Request::Episode.find_by_default_order(series_id, season, episode) - return episode
* ThetvdbApi::Request::Episode.find_by_dvd_order(series_id, season, episode) - return episode
* ThetvdbApi::Request::Episode.find_by_absolute_order(series_id, absolute) - return episode
* ThetvdbApi::Request::Episode.find(episode_id) - return episode
* ThetvdbApi::Request::Series.find(series_id) - return series
* ThetvdbApi::Request::Series.find_full(series_id) - return hash with series data and all episodes
* ThetvdbApi::Request::Update.day - return series updates from last day
* ThetvdbApi::Request::Update.week - return series updates from last week
* ThetvdbApi::Request::Update.month - return series updates from last month
* ThetvdbApi::Request::Update.all - return all series updates


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
