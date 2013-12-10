require 'spec_helper'

describe ThetvdbApi::Search do
  let(:klass) { ThetvdbApi::Search }
  let(:model) { klass.new(ThetvdbApi::Client.new(api_key: '123456789')) }

  describe '.get_series' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('GetSeries.php', seriesname: 'buffy', language: 'en').
        and_return(double(response: true))

      model.get_series('buffy', 'en')
    end
  end

  describe '.get_series_by_imdb_id' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('GetSeriesByRemoteID.php', imdbid: '1234', language: 'en').
        and_return(double(response: true))

      model.get_series_by_imdb_id('1234', 'en')
    end
  end

  describe '.get_series_by_zap2it_id' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('GetSeriesByRemoteID.php', zap2it: '1234', language: 'en').
        and_return(double(response: true))

      model.get_series_by_zap2it_id('1234', 'en')
    end
  end

  describe '#get_episode_by_air_date' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('GetEpisodeByAirDate.php', apikey: '123456789', seriesid: '1234',
        airdate: '2000-01-01', language: 'en').and_return(double(response: true))

      model.get_episode_by_air_date('1234', '2000-01-01', 'en')
    end
  end
end
