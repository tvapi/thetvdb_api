require "spec_helper"

class ThetvdbApi::Update < ThetvdbApi::Base
  def setup_adapter(connection)
    connection.adapter :test do |stub|
      stub.get("/api/123456789/updates/updates_day.xml") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/series.xml")]
      end
      stub.get("/api/123456789/updates/updates_week.xml") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/series.xml")]
      end
      stub.get("/api/123456789/updates/updates_month.xml") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/series.xml")]
      end
      stub.get("/api/123456789/updates/updates_all.xml") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/series.xml")]
      end
    end
  end
end

describe ThetvdbApi::Update do
  let(:client) { ThetvdbApi::Client.new(api_key: "123456789") }
  let(:model) { client.update }

  describe ".day" do
    it "returns Faraday::Response class" do
      expect(model.day).to be_a(Faraday::Response)
    end

    it "returns Hash class for body reponse" do
      expect(model.day.body).to be_a(Hash)
    end
  end

  describe ".day_url" do
    it "returns correct url" do
      expect(model.day_url).to eq("http://thetvdb.com/api/123456789/updates/updates_day.xml")
    end
  end

  describe ".week" do
    it "returns Faraday::Response class" do
      expect(model.week).to be_a(Faraday::Response)
    end

    it "returns Hash class for body reponse" do
      expect(model.week.body).to be_a(Hash)
    end
  end

  describe ".week_url" do
    it "returns correct url" do
      expect(model.week_url).to eq("http://thetvdb.com/api/123456789/updates/updates_week.xml")
    end
  end

  describe ".month" do
    it "returns Faraday::Response class" do
      expect(model.month).to be_a(Faraday::Response)
    end

    it "returns Hash class for body reponse" do
      expect(model.month.body).to be_a(Hash)
    end
  end

  describe ".month_url" do
    it "returns correct url" do
      expect(model.month_url).to eq("http://thetvdb.com/api/123456789/updates/updates_month.xml")
    end
  end

  describe ".all" do
    it "returns Faraday::Response class" do
      expect(model.all).to be_a(Faraday::Response)
    end

    it "returns Hash class for body reponse" do
      expect(model.all.body).to be_a(Hash)
    end
  end

  describe ".all_url" do
    it "returns correct url" do
      expect(model.all_url).to eq("http://thetvdb.com/api/123456789/updates/updates_all.xml")
    end
  end
end
