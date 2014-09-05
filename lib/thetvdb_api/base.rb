require 'service_api'

class ThetvdbApi::Base
  include ServiceApi::BaseFaraday

  def api_key_options
    { apikey: @config[:api_key] }
  end

  def language_options
    { language: @config[:language] }
  end

  def api_key_with_language_options
    api_key_options.merge(language_options)
  end

  def normalize_series_id_options(*options)
    normalize_options([:series_id], *options)
  end

  def normalize_series_id_absolute_options(*options)
    normalize_options([:series_id, :absolute], *options)
  end

  def normalize_series_id_episode_options(*options)
    normalize_options([:series_id, :season, :episode], *options)
  end

  def normalize_episode_id_options(*options)
    normalize_options([:episode_id], *options)
  end

  def normalize_series_name_options(*options)
    normalize_options({ name: :seriesname }, *options)
  end

  def normalize_series_id_air_date_options(*options)
    normalize_options({ series_id: :seriesid, air_date: :airdate }, *options)
  end

  private

  def uri_kind
    :colon
  end

  def base_url
    'http://thetvdb.com/api/'
  end
end
