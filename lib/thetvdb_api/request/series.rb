class ThetvdbApi::Request::Series < ThetvdbApi::Request::Base
  include ThetvdbApi::Request::Module::SeriesUri

  def self.find(series_id, language = ThetvdbApi::Configuration.language)
    new(find_path(series_id, language), :base)
  end

  def self.find_full(series_id, language = ThetvdbApi::Configuration.language)
    new(find_full_path(series_id, language), :full)
  end

  def self.find_path(series_id, language)
    "#{series_uri(series_id)}#{language}.xml"
  end

  def self.find_full_path(series_id, language)
    "#{series_uri(series_id)}all/#{language}.xml"
  end

  def initialize(uri, map_to)
    @uri = uri
    @map_to = map_to
  end

  def result
    @result ||= case @map_to
      when :base
        series_response
      when :full
        full_response
    end
  end

  def series_response
    object_response('Series')
  end

  def episodes_response
    collection_response('Episode')
  end

  def full_response
    {
      series: series_response,
      episodes: episodes_response
    }
  end
end
