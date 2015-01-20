require 'spec_helper'

describe ThetvdbApi::Episode do
  let(:model) { ThetvdbApi::Episode.new(api_key: API_KEY, language: 'en') }

  describe 'real request' do
    describe '.find_by_default_order' do
      it 'should return response class' do
        response = model.find_by_default_order(series_id: '72449', season: '1', episode: '2')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.find_by_dvd_order' do
      it 'should return response class' do
        response = model.find_by_dvd_order(series_id: '72449', season: '1', episode: '1')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.find_by_absolute_order' do
      it 'should return response class' do
        response = model.find_by_absolute_order(series_id: '70327', absolute: '1')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end

    describe '.find' do
      it 'should return response class' do
        response = model.find(id: '295696')
        ap response.body

        expect(response).to be_a(Faraday::Response)
        expect(response.status).to eq(200)
        expect(response.body).to be_a(Hash)
      end
    end
  end
end
