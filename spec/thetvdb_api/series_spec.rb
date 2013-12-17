require 'spec_helper'

describe ThetvdbApi::Series do
  let(:klass) { ThetvdbApi::Series }
  let(:model) { klass.new(ThetvdbApi::Client.new(api_key: '123456789')) }
  let(:mock_model) { SampleModel.new }

  describe '.find' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('{api_key}/series/{series_id}/{language}.xml').and_return(mock_model)

      model.find('1234', 'en')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(series_id: '1234', language: 'en').and_return(mock_model)

      model.find('1234', 'en')
    end
  end

  describe '.find_full' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('{api_key}/series/{series_id}/all/{language}.xml').and_return(mock_model)

      model.find_full('1234', 'en')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(series_id: '1234', language: 'en').and_return(mock_model)

      model.find_full('1234', 'en')
    end
  end
end
