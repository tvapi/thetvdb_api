require 'spec_helper'

describe ThetvdbApi::Episode do
  let(:klass) { ThetvdbApi::Episode }
  let(:model) { klass.new(ThetvdbApi::Client.new(api_key: '123456789')) }
  let(:mock_model) { SampleModel.new }

  describe '.find_by_default_order' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('{api_key}/series/{series_id}/{order}/{season}/{episode}/{language}.xml').and_return(mock_model)

      model.find_by_default_order('1234', '1', '1')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(series_id: '1234', season: '1', episode: '1', language: 'en', order: 'default').and_return(mock_model)

      model.find_by_default_order('1234', '1', '1')
    end
  end

  describe '.find_by_dvd_order' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('{api_key}/series/{series_id}/{order}/{season}/{episode}/{language}.xml').and_return(mock_model)

      model.find_by_dvd_order('1234', '1', '1')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(series_id: '1234', season: '1', episode: '1', language: 'en', order: 'dvd').and_return(mock_model)

      model.find_by_dvd_order('1234', '1', '1')
    end
  end

  describe '.find_by_absolute_order' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('{api_key}/series/{series_id}/absolute/{absolute}/{language}.xml').and_return(mock_model)

      model.find_by_absolute_order('1234', '1')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(series_id: '1234', absolute: '1', language: 'en').and_return(mock_model)

      model.find_by_absolute_order('1234', '1')
    end
  end

  describe '.find' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('{api_key}/episodes/{episode_id}/{language}.xml').and_return(mock_model)

      model.find('1234')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(episode_id: '1234', language: 'en').and_return(mock_model)

      model.find('1234')
    end
  end
end
