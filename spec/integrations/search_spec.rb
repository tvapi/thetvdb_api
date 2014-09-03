require 'spec_helper'

describe ThetvdbApi::Search do
  let(:model) { ThetvdbApi::Search.new(api_key: API_KEY) }

  describe 'real request' do
    describe '.get_series' do
      it 'should return response class' do
        response = model.get_series(seriesname: 'buffy')
        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.get_series_by_remote_id' do
      it 'should return response class with imdbid' do
        response = model.get_series_by_remote_id(imdbid: 'tt0118276')
        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end

      it 'should return response class with zap2itid' do
        response = model.get_series_by_remote_id(zap2itid: 'EP00213110')
        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.get_episode' do
      it 'should return response class' do
        response = model.get_episode(seriesid: '70327', airdate: '1997-03-10')
        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end
  end
end
