require 'spec_helper'

describe ThetvdbApi::Banner do
  let(:client) { ThetvdbApi::Client.new(api_key: '123456789', adapter: :test, adapter_options: faraday_stubs) }
  let(:model) { client.banner }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/api/123456789/series/1234/banners.xml') do
        [200, { content_type: 'xml' }, File.read('spec/fixtures/banners.xml')]
      end
    end
  end
  
  describe '.find' do
    it 'should return Faraday::Response class' do
      model.find(series_id: 1234).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.find(series_id: 1234).body == Hash
    end
  end

  describe '.find_url' do
    it 'should return correct url' do
      model.find_url(series_id: 1234).should == 'http://thetvdb.com/api/123456789/series/1234/banners.xml'
    end
  end
end
