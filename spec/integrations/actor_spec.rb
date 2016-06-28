require "spec_helper"

describe ThetvdbApi::Actor do
  let(:model) { ThetvdbApi::Actor.new(api_key: API_KEY) }

  describe ".find" do
    it "returns response class" do
      response = model.find(series_id: "72449")
      ap response.body

      expect(response).to be_a(Faraday::Response)
      expect(response.status).to eq(200)
      expect(response.body).to be_a(Hash)
    end
  end
end
