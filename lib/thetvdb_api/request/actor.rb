class ThetvdbApi::Request::Actor < ThetvdbApi::Request::Base
  include ThetvdbApi::Request::Module::Find
  include ThetvdbApi::Request::Module::SeriesUri

  def self.find_path(series_id)
    "#{series_uri(series_id)}actors.xml"
  end

  def result
    @result ||= collection_response('Actor')
  end

  private

  def data_key
    'Actors'
  end
end
