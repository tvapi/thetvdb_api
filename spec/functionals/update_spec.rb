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
      model.day.class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.day.body == Hash
    end
  end

  describe '.day_url' do
    it 'should return correct url' do
      model.day_url.should == 'http://thetvdb.com/api/123456789/updates/updates_day.xml'
    end
  end

  describe '.week' do
    it 'should return Faraday::Response class' do
      model.week.class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.week.body == Hash
    end
  end

  describe '.week_url' do
    it 'should return correct url' do
      model.week_url.should == 'http://thetvdb.com/api/123456789/updates/updates_week.xml'
    end
  end

  describe '.month' do
    it 'should return Faraday::Response class' do
      model.month.class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.month.body == Hash
    end
  end

  describe '.month_url' do
    it 'should return correct url' do
      model.month_url.should == 'http://thetvdb.com/api/123456789/updates/updates_month.xml'
    end
  end

  describe '.all' do
    it 'should return Faraday::Response class' do
      model.all.class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.all.body == Hash
    end
  end

  describe '.all_url' do
    it 'should return correct url' do
      model.all_url.should == 'http://thetvdb.com/api/123456789/updates/updates_all.xml'
    end
  end
end
