require 'spec_helper'

describe ThetvdbApi::Series do
  let(:client) { ThetvdbApi::Client.new(api_key: '123456789', adapter: :test, adapter_options: faraday_stubs) }
  let(:model) { client.series }

  let(:series_data) { File.read('spec/fixtures/series.xml') }
  let(:full_series_data) { File.read('spec/fixtures/full_series.xml') }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/api/123456789/series/1234/en.xml') { [200, {}, series_data] }
      stub.get('/api/123456789/series/1234/all/en.xml') { [200, {}, full_series_data] }
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

  describe '.find_full' do
    it 'should return Faraday::Response class' do
      model.find_full(series_id: 1234).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.find_full(series_id: 1234).body == Hash
    end
  end
end
