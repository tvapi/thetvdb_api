require 'spec_helper'

describe ThetvdbApi::Series do
  let(:client) { ThetvdbApi::Client.new(api_key: '123456789', adapter: :test, adapter_options: faraday_stubs) }
  let(:model) { client.series }

  let(:series_data) { File.read('spec/fixtures/series.xml') }
  let(:full_series_data) { File.read('spec/fixtures/full_series.xml') }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/api/123456789/series/1234/en.xml') { [200, { content_type: 'xml' }, series_data] }
      stub.get('/api/123456789/series/1234/all/en.xml') { [200, { content_type: 'xml' }, full_series_data] }
    end
  end
  
  describe '.find' do
    it 'should return Faraday::Response class' do
      expect(model.find(series_id: 1234)).to be_a(Faraday::Response)
    end

    it 'should return Hash class for body reponse' do
      expect(model.find(series_id: 1234).body).to be_a(Hash)
    end
  end

  describe '.find_url' do
    it 'should return correct url' do
      expect(model.find_url(series_id: 1234)).to eq('http://thetvdb.com/api/123456789/series/1234/en.xml')
    end
  end

  describe '.find_full' do
    it 'should return Faraday::Response class' do
      expect(model.find_full(series_id: 1234)).to be_a(Faraday::Response)
    end

    it 'should return Hash class for body reponse' do
      expect(model.find_full(series_id: 1234).body).to be_a(Hash)
    end
  end

  describe '.find_full_url' do
    it 'should return correct url' do
      expect(model.find_full_url(series_id: 1234)).to eq('http://thetvdb.com/api/123456789/series/1234/all/en.xml')
    end
  end
end
