require "spec_helper"

class ThetvdbApi::Actor < ThetvdbApi::Base
  def setup_adapter(connection)
    connection.adapter :test do |stub|
      stub.get("/api/123456789/series/1234/actors.xml") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/actors.xml")]
      end
    end
  end
end

describe ThetvdbApi::Actor do
  let(:client) { ThetvdbApi::Client.new(api_key: "123456789") }
  let(:model) { client.actor }

  describe ".find" do
    it "returns Faraday::Response class" do
      expect(model.find(series_id: 1234)).to be_a(Faraday::Response)
    end

    it "returns Hash class for body reponse" do
      expect(model.find(series_id: 1234).body).to be_a(Hash)
    end
  end

  describe ".find_url" do
    it "returns correct url" do
      expect(model.find_url(series_id: 1234)).to eq("http://thetvdb.com/api/123456789/series/1234/actors.xml")
    end
  end
end
