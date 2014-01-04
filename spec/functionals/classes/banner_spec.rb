require 'functionals/functional_spec_helper'

describe ThetvdbApi::Banner do
  include StubFaraday

  let(:model) { ThetvdbApi::Banner.new(ThetvdbApi::Client.new) }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/api/123456789/series/1234/banners.xml') { [200, {}, File.read('spec/fixtures/banners.xml')] }
    end
  end
  
  def banner_keys
    ['id', 'BannerPath', 'BannerType', 'BannerType2', 'Colors', 'Language', 'Rating', 'RatingCount', 'SeriesName',
     'ThumbnailPath', 'VignettePath'].sort
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
        model.find(1234, mapping: true).body.first.keys.sort.should == banner_keys
      end
    end
  end
end
