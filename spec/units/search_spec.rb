require 'spec_helper'

describe ThetvdbApi::Search do
  let(:klass) { ThetvdbApi::Search }
  let(:model) { klass.new(ThetvdbApi::Client.new(api_key: '123456789')) }
  let(:mock_model) { SampleModel.new }

  describe '.get_series' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('GetSeries.php').and_return(mock_model)

      model.get_series('buffy')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(seriesname: 'buffy').and_return(mock_model)

      model.get_series('buffy')
    end
  end

  describe '.get_series_url' do
    it 'should return correct string' do
      model.get_series_url('buffy').should == 'http://thetvdb.com/api/GetSeries.php'
    end
  end

  describe '.get_series_by_imdb_id' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('GetSeriesByRemoteID.php').and_return(mock_model)

      model.get_series_by_imdb_id('1234')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(imdbid: '1234').and_return(mock_model)

      model.get_series_by_imdb_id('1234')
    end
  end

  describe '.get_series_by_imdb_id_url' do
    it 'should return correct string' do
      model.get_series_by_imdb_id_url('1234').should == 'http://thetvdb.com/api/GetSeriesByRemoteID.php'
    end
  end

  describe '.get_series_by_zap2it_id' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('GetSeriesByRemoteID.php').and_return(mock_model)

      model.get_series_by_zap2it_id('1234')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(zap2it: '1234').and_return(mock_model)

      model.get_series_by_zap2it_id('1234')
    end
  end

  describe '.get_series_by_zap2it_id_url' do
    it 'should return correct string' do
      model.get_series_by_zap2it_id_url('1234').should == 'http://thetvdb.com/api/GetSeriesByRemoteID.php'
    end
  end

  describe '.get_episode' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('GetEpisodeByAirDate.php').and_return(mock_model)

      model.get_episode('1234', '2000-01-01')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(seriesid: '1234', airdate: '2000-01-01').and_return(mock_model)

      model.get_episode('1234', '2000-01-01')
    end
  end

  describe '.get_episode_url' do
    it 'should return correct string' do
      model.get_episode_url('1234', '2000-01-01').should == 'http://thetvdb.com/api/GetEpisodeByAirDate.php'
    end
  end
end
