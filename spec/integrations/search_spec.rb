require 'spec_helper'

describe ThetvdbApi::Search do
  let(:model) { ThetvdbApi::Search.new(api_key: API_KEY) }

  describe 'real request' do
    describe '.get_series' do
      it 'should return response class' do
        response = model.get_series(name: 'stargate')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.get_series_by_remote_id' do
      it 'should return response class with imdbid' do
        response = model.get_series_by_remote_id(imdb_id: 'tt0118480')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end

      it 'should return response class with zap2it' do
        response = model.get_series_by_remote_id(zap2it_id: 'EP00225421')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.get_episode' do
      it 'should return response class' do
        response = model.get_episode(series_id: '72449', air_date: '1997-07-27')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end
  end
end
