class ThetvdbApi::Request::Banner < ThetvdbApi::Request::Base
  include ThetvdbApi::Request::Module::Find
  include ThetvdbApi::Request::Module::SeriesUri

  def self.find_path(series_id)
    "#{series_uri(series_id)}banners.xml"
  end

  def result
    @result ||= collection_response('Banner')
  end

  private

  def data_key
    'Banners'
  end
end
