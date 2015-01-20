require 'spec_helper'

describe ThetvdbApi::Series do
  let(:model) { ThetvdbApi::Series.new(api_key: API_KEY, language: 'en') }

  describe '.find' do
    it 'should return response class' do
      response = model.find(id: '72449')
      ap response.body

      expect(response).to be_a(Faraday::Response)
      expect(response.status).to eq(200)
      expect(response.body).to be_a(Hash)
    end
  end

  describe '.find_full' do
    it 'should return response class' do
      response = model.find_full(id: '72449')
      ap response.body

      expect(response).to be_a(Faraday::Response)
      expect(response.status).to eq(200)
      expect(response.body).to be_a(Hash)
    end
  end
end
