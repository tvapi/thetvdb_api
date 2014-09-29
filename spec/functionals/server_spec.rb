require 'spec_helper'

describe ThetvdbApi::Server do
  let(:client) { ThetvdbApi::Client.new(api_key: '123456789', adapter: :test, adapter_options: faraday_stubs) }
  let(:model) { client.server }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/api/Updates.php?type=none') do
        [200, { content_type: 'xml' }, File.read('spec/fixtures/server_time.xml')]
      end
    end
  end

  describe '.time' do
    context 'hash attributes' do
      it 'should return Faraday::Response class' do
        expect(model.time).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.time.body).to be_a(Hash)
      end
    end

    context 'normal attributes' do
      it 'should return Faraday::Response class' do
        expect(model.time).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.time.body).to be_a(Hash)
      end
    end
  end
end