require 'spec_helper'

describe ThetvdbApi::Server do
  let(:model) { ThetvdbApi::Server.new(api_key: API_KEY) }

  describe '.time' do
    it 'should return response class' do
      response = model.time
      expect(response).to be_a(Faraday::Response)
      expect(response.status).to eq(200)
      expect(response.body).to be_a(Hash)
    end
  end
end
