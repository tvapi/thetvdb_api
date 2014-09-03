require 'spec_helper'

describe ThetvdbApi::Update do
  let(:model) { ThetvdbApi::Update.new(api_key: API_KEY, adapter: :net_http) }

  describe '.day' do
    it 'should return response class' do
      response = model.day
      expect(response).to be_a(Faraday::Response)
      expect(response.status).to eq(200)
      expect(response.body).to be_a(Hash)
    end
  end

  describe '.week' do
    it 'should return response class' do
      response = model.week
      expect(response).to be_a(Faraday::Response)
      expect(response.status).to eq(200)
      expect(response.body).to be_a(Hash)
    end
  end

  describe '.month' do
    it 'should return response class' do
      response = model.month
      expect(response).to be_a(Faraday::Response)
      expect(response.status).to eq(200)
      expect(response.body).to be_a(Hash)
    end
  end
end