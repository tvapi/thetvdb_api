require 'spec_helper'

describe ThetvdbApi::Request::Banner do
  let(:klass) { ThetvdbApi::Request::Banner }
  let(:model) { klass.new('http://example.com') }

  describe '#find' do
    it 'should call new with specific params' do
      klass.stub(:find_path).and_return('PATH')
      klass.should_receive(:new).with('PATH')

      klass.find('1234')
    end
  end

  describe '#find_path' do
    it 'should return correct uri' do
      ThetvdbApi::Configuration.stub(:api_key).and_return('API_KEY')

      klass.find_path('1234').should == 'API_KEY/series/1234/banners.xml'
    end
  end

  describe '#result' do
    it 'should call object_response method' do
      model.should_receive(:collection_response).with('Banner')

      model.result
    end
  end
end
