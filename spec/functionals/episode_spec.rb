require "spec_helper"

class ThetvdbApi::Episode < ThetvdbApi::Base
  def setup_adapter(connection)
    connection.adapter :test do |stub|
      stub.get("/api/123456789/series/1234/default/1/1/en.xml") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/episode.xml")]
      end
      stub.get("/api/123456789/series/1234/dvd/1/1/en.xml") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/episode.xml")]
      end
      stub.get("/api/123456789/series/1234/absolute/1/en.xml") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/episode.xml")]
      end
      stub.get("/api/123456789/episodes/1234/en.xml") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/episode.xml")]
      end
    end
  end
end

describe ThetvdbApi::Episode do
  let(:client) { ThetvdbApi::Client.new(api_key: "123456789") }
  let(:model) { client.episode }

  describe ".find_by_default_order" do
    context "hash attributes" do
      it "returns Faraday::Response class" do
        expect(model.find_by_default_order(series_id: 1234, season: 1, episode: 1, language: "en")).
          to be_a(Faraday::Response)
      end

      it "returns Hash class for body reponse" do
        expect(model.find_by_default_order(series_id: 1234, season: 1, episode: 1, language: "en").body).to be_a(Hash)
      end
    end
  end

  describe ".find_by_default_order_url" do
    context "hash attributes" do
      it "returns correct url" do
        expect(
          model.find_by_default_order_url(series_id: 1234, season: 1, episode: 1, language: "en")
        ).to eq("http://thetvdb.com/api/123456789/series/1234/default/1/1/en.xml")
      end
    end
  end

  describe ".find_by_dvd_order" do
    context "hash attributes" do
      it "returns Faraday::Response class" do
        expect(model.find_by_dvd_order(series_id: 1234, season: 1, episode: 1, language: "en")).
          to be_a(Faraday::Response)
      end

      it "returns Hash class for body reponse" do
        expect(model.find_by_dvd_order(series_id: 1234, season: 1, episode: 1, language: "en").body).
          to be_a(Hash)
      end
    end
  end

  describe ".find_by_dvd_order_url" do
    context "hash attributes" do
      it "returns correct url" do
        expect(
          model.find_by_dvd_order_url(series_id: 1234, season: 1, episode: 1, language: "en")
        ).to eq("http://thetvdb.com/api/123456789/series/1234/dvd/1/1/en.xml")
      end
    end
  end

  describe ".find_by_absolute_order" do
    context "hash attributes" do
      it "returns Faraday::Response class" do
        expect(model.find_by_absolute_order(series_id: 1234, absolute: 1, language: "en")).to be_a(Faraday::Response)
      end

      it "returns Hash class for body reponse" do
        expect(model.find_by_absolute_order(series_id: 1234, absolute: 1, language: "en").body).to be_a(Hash)
      end
    end
  end

  describe ".find_by_absolute_order_url" do
    context "hash attributes" do
      it "returns correct url" do
        expect(
          model.find_by_absolute_order_url(series_id: 1234, absolute: 1, language: "en")
        ).to eq("http://thetvdb.com/api/123456789/series/1234/absolute/1/en.xml")
      end
    end
  end

  describe ".find" do
    context "hash attributes" do
      it "returns Faraday::Response class" do
        expect(model.find(id: 1234, language: "en")).to be_a(Faraday::Response)
      end

      it "returns Hash class for body reponse" do
        expect(model.find(id: 1234, language: "en").body).to be_a(Hash)
      end
    end
  end

  describe ".find_url" do
    context "hash attributes" do
      it "returns correct url" do
        expect(
          model.find_url(id: 1234, language: "en")
        ).to eq("http://thetvdb.com/api/123456789/episodes/1234/en.xml")
      end
    end
  end
end
