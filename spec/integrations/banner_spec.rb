require 'spec_helper'

describe ThetvdbApi::Banner do
  let(:model) { ThetvdbApi::Banner.new(api_key: API_KEY) }

  describe '.find' do
    it 'should return response class' do
      response = model.find(series_id: '70327')
      expect(response).to be_a(Faraday::Response)
      expect(response.status).to eq(200)
      expect(response.body).to be_a(Hash)
    end
  end
end
