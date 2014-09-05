require 'spec_helper'

describe ThetvdbApi::Actor do
  let(:client) { ThetvdbApi::Client.new(api_key: '123456789', adapter: :test, adapter_options: faraday_stubs) }
  let(:model) { client.actor }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/api/123456789/series/1234/actors.xml') do
        [200, { content_type: 'xml' }, File.read('spec/fixtures/actors.xml')]
      end
    end
  end

  describe '.find' do
    context 'hash attributes' do
      it 'should return Faraday::Response class' do
        expect(model.find(series_id: 1234)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.find(series_id: 1234).body).to be_a(Hash)
      end
    end

    context 'normal attributes' do
      it 'should return Faraday::Response class' do
        expect(model.find(1234)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.find(1234).body).to be_a(Hash)
      end
    end
  end

  describe '.find_url' do
    context 'hash attributes' do
      it 'should return correct url' do
        expect(model.find_url(series_id: 1234)).to eq('http://thetvdb.com/api/123456789/series/1234/actors.xml')
      end
    end

    context 'normal attributes' do
      it 'should return correct url' do
        expect(model.find_url(1234)).to eq('http://thetvdb.com/api/123456789/series/1234/actors.xml')
      end
    end
  end
end
