require 'functionals/functional_spec_helper'

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
    it 'should return Faraday::Response class' do
      model.find(1234).class.should == Faraday::Response
    end

    it 'should return Hash class for body reponse' do
      model.find(1234).body == Hash
    end
  end
end
