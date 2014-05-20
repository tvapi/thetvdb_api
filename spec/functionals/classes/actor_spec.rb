require 'functionals/functional_spec_helper'

describe ThetvdbApi::Actor do
  include StubFaraday

  let(:client) { ThetvdbApi::Client.new(api_key: '123456789', adapter: :test) }
  let(:model) { client.actor }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/api/123456789/series/1234/actors.xml') { [200, {}, File.read('spec/fixtures/actors.xml')] }
    end
  end

  def actor_keys
    ['id', 'Image', 'Name', 'Role', 'SortOrder'].sort
  end

  before do
    stub_request(model, faraday_stubs)
  end

  describe '.find' do
    it 'should return string without mapping' do
      model.find(1234).body.class.should == String
    end

    describe 'with mapping' do
      it 'should return Array' do
        model.find(1234, mapping: true).body.class.should == Array
      end

      it 'should return not empty Array' do
        model.find(1234, mapping: true).body.should_not be_empty
      end

      it 'should return specific keys for first element' do
        model.find(1234, mapping: true).body.first.keys.sort.should == actor_keys
      end
    end
  end
end
