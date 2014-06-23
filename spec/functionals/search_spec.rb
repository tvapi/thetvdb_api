require 'spec_helper'

describe ThetvdbApi::Search do
  let(:client) { ThetvdbApi::Client.new(api_key: '123456789', adapter: :test, adapter_options: faraday_stubs) }
  let(:model) { client.search }

  let(:get_series_data) { File.read('spec/fixtures/get_series.xml') }
  let(:get_series_by_remote_data) { File.read('spec/fixtures/get_series_by_remote.xml') }
  let(:get_episode_data) { File.read('spec/fixtures/get_episode.xml') }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/api/GetSeries.php?seriesname=Supernatural') { [200, {}, get_series_data] }
      stub.get('/api/GetSeriesByRemoteID.php?imdbid=tt0290978') { [200, {}, get_series_by_remote_data] }
      stub.get('/api/GetEpisodeByAirDate.php?airdate=2007-09-24&apikey=123456789&language=en&seriesid=80348') do
        [200, {}, get_episode_data]
      end
    end
  end
  
  describe '.get_series' do
    it 'should return Faraday::Response class' do
      model.get_series(seriesname: 'Supernatural').class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.get_series(seriesname: 'Supernatural').body == Hash
    end
  end

  describe '.get_series_url' do
    it 'should return correct url' do
      model.get_series_url(seriesname: 'Supernatural').
        should == 'http://thetvdb.com/api/GetSeries.php?language=en&seriesname=Supernatural'
    end
  end

  describe '.get_series_by_remote_id' do
    it 'should return Faraday::Response class' do
      model.get_series_by_remote_id(imdbid: 'tt0290978').class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.get_series_by_remote_id(imdbid: 'tt0290978').body == Hash
    end
  end

  describe '.get_series_by_remote_id_url' do
    it 'should return correct url' do
      model.get_series_by_remote_id_url(imdbid: 'tt0290978').
        should == 'http://thetvdb.com/api/GetSeriesByRemoteID.php?language=en&imdbid=tt0290978'
    end
  end

  describe '.get_episode' do
    it 'should return Faraday::Response class' do
      model.get_episode(seriesid: 80348, airdate: '2007-09-24').class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.get_episode(seriesid: 80348, airdate: '2007-09-24').body == Hash
    end
  end

  describe '.get_episode_url' do
    it 'should return correct url' do
      model.get_episode_url(seriesid: 80348, airdate: '2007-09-24').
        should == 'http://thetvdb.com/api/GetEpisodeByAirDate.php?apikey=123456789&language=en&seriesid=80348&airdate=2007-09-24'
    end
  end
end
