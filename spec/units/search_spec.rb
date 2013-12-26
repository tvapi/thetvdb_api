require 'spec_helper'

describe ThetvdbApi::Search do
  let(:klass) { ThetvdbApi::Search }
  let(:model) { klass.new(ThetvdbApi::Client.new(api_key: '123456789')) }

  describe '.get_series' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:get_series_get_with_params).with('buffy', {}).and_return(double(response: true))

      model.get_series('buffy')
    end

    it 'should call response with specific arguments' do
      model.should_receive(:response).with(ThetvdbApi::Response::SearchMultipleSeries)

      model.get_series('buffy')
    end
  end

  describe '.get_series_url' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:get_series_get_with_params).with('buffy', {}).and_return(double(url: true))

      model.get_series_url('buffy')
    end

    it 'should call url' do
      model.should_receive(:url)

      model.get_series_url('buffy')
    end
  end

  describe '.get_series_get_with_params' do
    it 'should call get with specific arguments' do
      model.stub(:get_series_path).and_return('PATH')
      model.should_receive(:get).with('PATH').and_return(double(params: true))

      model.get_series_get_with_params('buffy', {})
    end

    it 'should call params with specific arguments' do
      model.should_receive(:params).with(seriesname: 'buffy')

      model.get_series_get_with_params('buffy', {})
    end
  end

  describe '.get_series_by_imdb_id' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:get_series_by_imdb_id_get_with_params).with('1234', {}).and_return(double(response: true))

      model.get_series_by_imdb_id('1234')
    end

    it 'should call response with specific arguments' do
      model.should_receive(:response).with(ThetvdbApi::Response::SearchSeries)

      model.get_series_by_imdb_id('1234')
    end
  end

  describe '.get_series_by_imdb_id_url' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:get_series_by_imdb_id_get_with_params).with('1234', {}).and_return(double(url: true))

      model.get_series_by_imdb_id_url('1234')
    end

    it 'should call url' do
      model.should_receive(:url)

      model.get_series_by_imdb_id_url('1234')
    end
  end

  describe '.get_series_by_imdb_id_get_with_params' do
    it 'should call get with specific arguments' do
      model.stub(:get_series_by_remote_id_path).and_return('PATH')
      model.should_receive(:get).with('PATH').and_return(double(params: true))

      model.get_series_by_imdb_id_get_with_params('1234', {})
    end

    it 'should call params with specific arguments' do
      model.should_receive(:params).with(imdbid: '1234')

      model.get_series_by_imdb_id_get_with_params('1234', {})
    end
  end

  describe '.get_series_by_zap2it_id' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:get_series_by_zap2it_id_get_with_params).with('1234', {}).and_return(double(response: true))

      model.get_series_by_zap2it_id('1234')
    end

    it 'should call response with specific arguments' do
      model.should_receive(:response).with(ThetvdbApi::Response::SearchSeries)

      model.get_series_by_zap2it_id('1234')
    end
  end

  describe '.get_series_by_zap2it_id_url' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:get_series_by_zap2it_id_get_with_params).with('1234', {}).and_return(double(url: true))

      model.get_series_by_zap2it_id_url('1234')
    end

    it 'should call url' do
      model.should_receive(:url)

      model.get_series_by_zap2it_id_url('1234')
    end
  end

  describe '.get_series_by_imdb_id_get_with_params' do
    it 'should call get with specific arguments' do
      model.stub(:get_series_by_remote_id_path).and_return('PATH')
      model.should_receive(:get).with('PATH').and_return(double(params: true))

      model.get_series_by_zap2it_id_get_with_params('1234', {})
    end

    it 'should call params with specific arguments' do
      model.should_receive(:params).with(zap2it: '1234')

      model.get_series_by_zap2it_id_get_with_params('1234', {})
    end
  end

  describe '.get_episode' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:get_episode_get_with_params).with('1234', '2000-01-01', {}).and_return(double(response: true))

      model.get_episode('1234', '2000-01-01')
    end

    it 'should call response with specific arguments' do
      model.should_receive(:response).with(ThetvdbApi::Response::SearchMultipleEpisode)

      model.get_episode('1234', '2000-01-01')
    end
  end

  describe '.get_episode_url' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:get_episode_get_with_params).with('1234', '2000-01-01', {}).and_return(double(url: true))

      model.get_episode_url('1234', '2000-01-01')
    end

    it 'should call url' do
      model.should_receive(:url)

      model.get_episode_url('1234', '2000-01-01')
    end
  end

  describe '.get_episode_get_with_params' do
    it 'should call get with specific arguments' do
      model.stub(:get_episode_path).and_return('PATH')
      model.should_receive(:get).with('PATH').and_return(double(params: true))

      model.get_episode_get_with_params('1234', '2000-01-01', {})
    end

    it 'should call params with specific arguments' do
      model.should_receive(:params).with(seriesid: '1234', airdate: '2000-01-01')

      model.get_episode_get_with_params('1234', '2000-01-01', {})
    end
  end
end
