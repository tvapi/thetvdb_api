require 'spec_helper'

describe ThetvdbApi::Request::Search do
  let(:klass) { ThetvdbApi::Request::Search }
  let(:model) { klass.new('http://example.com', :series) }

  describe '#get_series' do
    it 'should call new with specific params' do
      klass.should_receive(:new).with('GetSeries.php', :series, seriesname: 'buffy', language: 'en')

      klass.get_series('buffy', 'en')
    end
  end

  describe '#get_series_by_imdb_id' do
    it 'should call new with specific params' do
      klass.should_receive(:new).with('GetSeriesByRemoteID.php', :series, imdbid: '1234', language: 'en')

      klass.get_series_by_imdb_id('1234', 'en')
    end
  end

  describe '#get_series_by_zap2it_id' do
    it 'should call new with specific params' do
      klass.should_receive(:new).with('GetSeriesByRemoteID.php', :series, zap2it: '1234', language: 'en')

      klass.get_series_by_zap2it_id('1234', 'en')
    end
  end

  describe '#get_episode_by_air_date' do
    it 'should call new with specific params' do
      ThetvdbApi::Configuration.stub(:api_key).and_return('API_KEY')
      klass.should_receive(:new).with('GetEpisodeByAirDate.php', :episode, apikey: 'API_KEY', seriesid: '1234',
                                      airdate: '2000-01-01', language: 'en')

      klass.get_episode_by_air_date('1234', '2000-01-01', 'en')
    end
  end

  describe '#response' do
    it 'should call get klass method' do
      ThetvdbApi::Request::Search.should_receive(:get)
      model.stub(:request_options).and_return({})

      model.response
    end
  end

  describe '#result' do
    it 'should call collection_response method' do
      model.should_receive(:collection_response)

      model.result
    end
  end
end
