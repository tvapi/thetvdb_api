require "spec_helper"

describe ThetvdbApi::Update do
  let(:model) { ThetvdbApi::Update.new(api_key: API_KEY) }

  describe ".day" do
    it "returns response class" do
      response = model.day
      ap response.body

      expect(response).to be_a(Faraday::Response)
      expect(response.status).to eq(200)
      expect(response.body).to be_a(Hash)
    end
  end

  describe ".week" do
    it "returns response class" do
      response = model.week
      ap response.body

      expect(response).to be_a(Faraday::Response)
      expect(response.status).to eq(200)
      expect(response.body).to be_a(Hash)
    end
  end

  describe ".month" do
    it "returns response class" do
      response = model.month
      ap response.body

      expect(response).to be_a(Faraday::Response)
      expect(response.status).to eq(200)
      expect(response.body).to be_a(Hash)
    end
  end
end
