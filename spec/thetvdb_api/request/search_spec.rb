require 'spec_helper'

describe ThetvdbApi::Request::Search do
  let(:klass) { ThetvdbApi::Request::Search }
  let(:result_kind) { :object }
  let(:model) { klass.new('http://example.com', :series, result_kind) }

  describe '#get_series' do
    it 'should call new with specific params' do
      klass.should_receive(:new).with('GetSeries.php', :series, :collection, seriesname: 'buffy', language: 'en')

      klass.get_series('buffy', 'en')
    end
  end

  describe '#get_series_by_imdb_id' do
    it 'should call new with specific params' do
      klass.should_receive(:new).with('GetSeriesByRemoteID.php', :series, :object, imdbid: '1234', language: 'en')

      klass.get_series_by_imdb_id('1234', 'en')
    end
  end

  describe '#get_series_by_zap2it_id' do
    it 'should call new with specific params' do
      klass.should_receive(:new).with('GetSeriesByRemoteID.php', :series, :object, zap2it: '1234', language: 'en')

      klass.get_series_by_zap2it_id('1234', 'en')
    end
  end

  describe '#get_episode_by_air_date' do
    it 'should call new with specific params' do
      ThetvdbApi::Configuration.stub(:api_key).and_return('API_KEY')
      klass.should_receive(:new).with('GetEpisodeByAirDate.php', :episode, :object, apikey: 'API_KEY', seriesid: '1234',
        airdate: '2000-01-01', language: 'en')

      klass.get_episode_by_air_date('1234', '2000-01-01', 'en')
    end
  end

  describe '#response' do
    it 'should call get klass method' do
      klass.should_receive(:get)
      model.stub(:request_options).and_return({})

      model.response
    end
  end

  describe '#result' do
    describe 'for collection result' do
      let(:result_kind) { :collection }

      it 'should call collection_response method' do
        model.should_receive(:collection_response)

        model.result
      end
    end

    describe 'for object result' do
      let(:result_kind) { :object }

      it 'should call collection_response method' do
        model.should_receive(:object_response)

        model.result
      end
    end
  end
end
