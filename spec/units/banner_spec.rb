require 'spec_helper'

describe ThetvdbApi::Banner do
  let(:klass) { ThetvdbApi::Banner }
  let(:model) { klass.new(ThetvdbApi::Client.new(api_key: '123456789')) }
  let(:mock_model) { SampleModel.new }

  describe '.find' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('{api_key}/series/{series_id}/banners.xml').and_return(mock_model)

      model.find('1234')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(series_id: '1234').and_return(mock_model)

      model.find('1234')
    end
  end

  describe '.find_url' do
    it 'should return correct string' do
      model.find_url('1234').should == "http://thetvdb.com/api/#{model.api_key}/series/1234/banners.xml"
    end
  end
end
