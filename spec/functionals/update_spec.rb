require 'spec_helper'

describe ThetvdbApi::Update do
  let(:client) { ThetvdbApi::Client.new(api_key: '123456789', adapter: :test, adapter_options: faraday_stubs) }
  let(:model) { client.update }

  let(:updates_data) { File.read('spec/fixtures/series.xml') }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/api/123456789/updates/updates_day.xml') { [200, { content_type: 'xml' }, updates_data] }
      stub.get('/api/123456789/updates/updates_week.xml') { [200, { content_type: 'xml' }, updates_data] }
      stub.get('/api/123456789/updates/updates_month.xml') { [200, { content_type: 'xml' }, updates_data] }
      stub.get('/api/123456789/updates/updates_all.xml') { [200, { content_type: 'xml' }, updates_data] }
    end
  end

  describe '.day' do
    it 'should return Faraday::Response class' do
      expect(model.day).to be_a(Faraday::Response)
    end

    it 'should return Hash class for body reponse' do
      expect(model.day.body).to be_a(Hash)
    end
  end

  describe '.day_url' do
    it 'should return correct url' do
      expect(model.day_url).to eq('http://thetvdb.com/api/123456789/updates/updates_day.xml')
    end
  end

  describe '.week' do
    it 'should return Faraday::Response class' do
      expect(model.week).to be_a(Faraday::Response)
    end

    it 'should return Hash class for body reponse' do
      expect(model.week.body).to be_a(Hash)
    end
  end

  describe '.week_url' do
    it 'should return correct url' do
      expect(model.week_url).to eq('http://thetvdb.com/api/123456789/updates/updates_week.xml')
    end
  end

  describe '.month' do
    it 'should return Faraday::Response class' do
      expect(model.month).to be_a(Faraday::Response)
    end

    it 'should return Hash class for body reponse' do
      expect(model.month.body).to be_a(Hash)
    end
  end

  describe '.month_url' do
    it 'should return correct url' do
      expect(model.month_url).to eq('http://thetvdb.com/api/123456789/updates/updates_month.xml')
    end
  end

  describe '.all' do
    it 'should return Faraday::Response class' do
      expect(model.all).to be_a(Faraday::Response)
    end

    it 'should return Hash class for body reponse' do
      expect(model.all.body).to be_a(Hash)
    end
  end

  describe '.all_url' do
    it 'should return correct url' do
      expect(model.all_url).to eq('http://thetvdb.com/api/123456789/updates/updates_all.xml')
    end
  end
end
