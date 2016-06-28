require "spec_helper"

class ThetvdbApi::Series < ThetvdbApi::Base
  def setup_adapter(connection)
    connection.adapter :test do |stub|
      stub.get("/api/123456789/series/1234/en.xml") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/series.xml")]
      end
      stub.get("/api/123456789/series/1234/all/en.xml") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/full_series.xml")]
      end
    end
  end
end

describe ThetvdbApi::Series do
  let(:client) { ThetvdbApi::Client.new(api_key: "123456789") }
  let(:model) { client.series }

  describe ".find" do
    it "returns Faraday::Response class" do
      expect(model.find(id: 1234, language: "en")).to be_a(Faraday::Response)
    end

    it "returns Hash class for body reponse" do
      expect(model.find(id: 1234, language: "en").body).to be_a(Hash)
    end
  end

  describe ".find_url" do
    it "returns correct url" do
      expect(model.find_url(id: 1234, language: "en")).to eq("http://thetvdb.com/api/123456789/series/1234/en.xml")
    end
  end

  describe ".find_full" do
    it "returns Faraday::Response class" do
      expect(model.find_full(id: 1234, language: "en")).to be_a(Faraday::Response)
    end

    it "returns Hash class for body reponse" do
      expect(model.find_full(id: 1234, language: "en").body).to be_a(Hash)
    end
  end

  describe ".find_full_url" do
    it "returns correct url" do
      expect(model.find_full_url(id: 1234, language: "en")).
        to eq("http://thetvdb.com/api/123456789/series/1234/all/en.xml")
    end
  end
end
