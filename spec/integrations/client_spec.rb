require 'spec_helper'

describe ThetvdbApi::Client do
  let(:client) { ThetvdbApi::Client.new(api_key: API_KEY) }

  describe '.search' do
    describe '.get_series' do
      it 'should return response class' do
        response = client.search.get_series(seriesname: 'stargate')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.get_series_by_remote_id' do
      it 'should return response class with imdbid' do
        response = client.search.get_series_by_remote_id(imdbid: 'tt0118480')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end

      it 'should return response class with zap2itid' do
        response = client.search.get_series_by_remote_id(zap2itid: 'EP00225421')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.get_episode' do
      it 'should return response class' do
        response = client.search.get_episode(seriesid: '72449', airdate: '1997-07-27')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end
  end

  describe '.series' do
    describe '.find' do
      it 'should return response class' do
        response = client.series.find(series_id: '72449')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.find_full' do
      it 'should return response class' do
        response = client.series.find_full(series_id: '72449')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end
  end

  describe '.actor' do
    describe '.find' do
      it 'should return response class' do
        response = client.actor.find(series_id: '72449')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end
  end
  
  describe '.server' do
    describe '.time' do
      it 'should return response class' do
        response = client.server.time
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end
  end

  describe '.banner' do
    describe '.find' do
      it 'should return response class' do
        response = client.banner.find(series_id: '72449')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end
  end

  describe '.episode' do
    describe '.find_by_default_order' do
      it 'should return response class' do
        response = client.episode.find_by_default_order(series_id: '72449', season: '1', episode: '1')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.find_by_dvd_order' do
      it 'should return response class' do
        response = client.episode.find_by_dvd_order(series_id: '72449', season: '1', episode: '1')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.find_by_absolute_order' do
      it 'should return response class' do
        response = client.episode.find_by_absolute_order(series_id: '70327', absolute: '1')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.find' do
      it 'should return response class' do
        response = client.episode.find(episode_id: '295696')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end
  end

  describe '.update' do
    describe '.day' do
      it 'should return response class' do
        response = client.update.day
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.week' do
      it 'should return response class' do
        response = client.update.week
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.month' do
      it 'should return response class' do
        response = client.update.month
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end
  end
end
