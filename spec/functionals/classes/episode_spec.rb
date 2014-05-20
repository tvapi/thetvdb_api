require 'functionals/functional_spec_helper'

describe ThetvdbApi::Episode do
  include StubFaraday

  let(:client) { ThetvdbApi::Client.new(api_key: '123456789', adapter: :test) }
  let(:model) { client.episode }

  let(:episode_data) { File.read('spec/fixtures/episode.xml') }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/api/123456789/series/1234/default/1/1/en.xml') { [200, {}, episode_data] }
      stub.get('/api/123456789/series/1234/dvd/1/1/en.xml') { [200, {}, episode_data] }
      stub.get('/api/123456789/series/1234/absolute/1/en.xml') { [200, {}, episode_data] }
      stub.get('/api/123456789/episodes/1234/en.xml') { [200, {}, episode_data] }
    end
  end

  def episode_keys
    ['id', 'seasonid', 'EpisodeNumber', 'EpisodeName', 'FirstAired', 'GuestStars', 'Director', 'Writer', 'Overview',
     'ProductionCode', 'lastupdated', 'flagged', 'DVD_discid', 'DVD_season', 'DVD_episodenumber', 'DVD_chapter',
     'absolute_number', 'filename', 'seriesid', 'thumb_added', 'thumb_width', 'thumb_height', 'tms_export',
     'mirrorupdate', 'IMDB_ID', 'EpImgFlag', 'Rating', 'SeasonNumber', 'Language'].sort
  end

  before do
    stub_request(model, faraday_stubs)
  end

  describe '.find_by_default_order' do
    it 'should return string without mapping' do
      model.find_by_default_order(1234, 1, 1).body.class.should == String
    end

    describe 'with mapping' do
      it 'should return Hash' do
        model.find_by_default_order(1234, 1, 1, mapping: true).body.class.should == Hash
      end

      it 'should return specific keys' do
        model.find_by_default_order(1234, 1, 1, mapping: true).body.keys.sort.should == episode_keys
      end
    end
  end

  describe '.find_by_dvd_order' do
    it 'should return string without mapping' do
      model.find_by_dvd_order(1234, 1, 1).body.class.should == String
    end

    describe 'with mapping' do
      it 'should return Hash' do
        model.find_by_dvd_order(1234, 1, 1, mapping: true).body.class.should == Hash
      end

      it 'should return specific keys' do
        model.find_by_dvd_order(1234, 1, 1, mapping: true).body.keys.sort.should == episode_keys
      end
    end
  end

  describe '.find_by_absolute_order' do
    it 'should return string without mapping' do
      model.find_by_absolute_order(1234, 1).body.class.should == String
    end

    describe 'with mapping' do
      it 'should return Hash' do
        model.find_by_absolute_order(1234, 1, mapping: true).body.class.should == Hash
      end

      it 'should return specific keys' do
        model.find_by_absolute_order(1234, 1, mapping: true).body.keys.sort.should == episode_keys
      end
    end
  end

  describe '.find' do
    it 'should return string without mapping' do
      model.find(1234).body.class.should == String
    end

    describe 'with mapping' do
      it 'should return Hash' do
        model.find(1234, mapping: true).body.class.should == Hash
      end

      it 'should return specific keys' do
        model.find(1234, mapping: true).body.keys.sort.should == episode_keys
      end
    end
  end
end
