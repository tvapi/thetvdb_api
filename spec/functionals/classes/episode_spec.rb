require 'functionals/functional_spec_helper'

describe ThetvdbApi::Episode do
  let(:client) { ThetvdbApi::Client.new(api_key: '123456789', adapter: :test, adapter_options: faraday_stubs) }
  let(:model) { client.episode }

  let(:episode_data) { File.read('spec/fixtures/episode.xml') }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/api/123456789/series/1234/default/1/1/en.xml') { [200, { content_type: 'xml' }, episode_data] }
      stub.get('/api/123456789/series/1234/dvd/1/1/en.xml') { [200, { content_type: 'xml' }, episode_data] }
      stub.get('/api/123456789/series/1234/absolute/1/en.xml') { [200, { content_type: 'xml' }, episode_data] }
      stub.get('/api/123456789/episodes/1234/en.xml') { [200, { content_type: 'xml' }, episode_data] }
    end
  end

  describe '.find_by_default_order' do
    it 'should return Faraday::Response class' do
      model.find_by_default_order(1234, 1, 1).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.find_by_default_order(1234, 1, 1).body == Hash
    end
  end

  describe '.find_by_dvd_order' do
    it 'should return Faraday::Response class' do
      model.find_by_dvd_order(1234, 1, 1).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.find_by_dvd_order(1234, 1, 1).body == Hash
    end
  end

  describe '.find_by_absolute_order' do
    it 'should return Faraday::Response class' do
      model.find_by_absolute_order(1234, 1).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.find_by_absolute_order(1234, 1).body == Hash
    end
  end

  describe '.find' do
    it 'should return Faraday::Response class' do
      model.find(1234).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.find(1234).body == Hash
    end
  end
end
