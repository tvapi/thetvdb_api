require 'functionals/functional_spec_helper'

describe ThetvdbApi::Series do
  include StubFaraday

  let(:client) { ThetvdbApi::Client.new(api_key: '123456789', adapter: :test) }
  let(:model) { client.series }

  let(:series_data) { File.read('spec/fixtures/series.xml') }
  let(:full_series_data) { File.read('spec/fixtures/full_series.xml') }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/api/123456789/series/1234/en.xml') { [200, {}, series_data] }
      stub.get('/api/123456789/series/1234/all/en.xml') { [200, {}, full_series_data] }
    end
  end
  
  def series_keys
    ['id', 'Actors', 'Airs_DayOfWeek', 'Airs_Time', 'ContentRating', 'FirstAired', 'Genre', 'IMDB_ID', 'Language',
     'Network', 'NetworkID', 'Overview', 'Rating', 'RatingCount', 'Runtime', 'SeriesID', 'SeriesName', 'Status',
     'added', 'addedBy', 'banner', 'fanart', 'lastupdated', 'poster', 'zap2it_id'].sort
  end

  def episode_keys
    ['Combined_episodenumber', 'Combined_season', 'DVD_chapter', 'DVD_discid', 'DVD_episodenumber', 'DVD_season',
     'Director', 'EpImgFlag', 'EpisodeName', 'EpisodeNumber', 'FirstAired', 'GuestStars', 'IMDB_ID', 'Language',
     'Overview', 'ProductionCode', 'Rating', 'RatingCount', 'SeasonNumber', 'Writer', 'absolute_number',
     'airsafter_season', 'airsbefore_episode', 'airsbefore_season', 'filename', 'id', 'lastupdated', 'seasonid',
     'seriesid', 'thumb_added', 'thumb_height', 'thumb_width'].sort
  end

  before do
    stub_request(model, faraday_stubs)
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
        model.find(1234, mapping: true).body.keys.sort.should == series_keys
      end
    end
  end

  describe '.find_full' do
    it 'should return string without mapping' do
      model.find_full(1234).body.class.should == String
    end

    describe 'with mapping' do
      it 'should return Hash' do
        model.find_full(1234, mapping: true).body.class.should == Hash
      end

      it 'should return specific keys' do
        model.find_full(1234, mapping: true).body.keys.sort.should == ['Series', 'Episode'].sort
      end

      describe 'Series' do
        it 'should return Hash' do
          model.find_full(1234, mapping: true).body['Series'].class.should == Hash
        end

        it 'should return specific keys' do
          model.find_full(1234, mapping: true).body['Series'].keys.sort.should == series_keys
        end
      end

      describe 'Episode' do
        it 'should return Array' do
          model.find_full(1234, mapping: true).body['Episode'].class.should == Array
        end

        it 'should return not empty Array' do
          model.find_full(1234, mapping: true).body['Episode'].should_not be_empty
        end

        it 'should return specific keys for first element' do
          model.find_full(1234, mapping: true).body['Episode'].first.keys.sort.should == episode_keys
        end
      end
    end
  end
end
