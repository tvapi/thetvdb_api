require "spec_helper"

class ThetvdbApi::Server < ThetvdbApi::Base
  def setup_adapter(connection)
    connection.adapter :test do |stub|
      stub.get("/api/Updates.php?type=none") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/server_time.xml")]
      end
    end
  end
end

describe ThetvdbApi::Server do
  let(:client) { ThetvdbApi::Client.new(api_key: "123456789") }
  let(:model) { client.server }

  describe ".time" do
    it "returns Faraday::Response class" do
      expect(model.time).to be_a(Faraday::Response)
    end

    it "returns Hash class for body reponse" do
      expect(model.time.body).to be_a(Hash)
    end
  end

  describe ".time_url" do
    it "returns correct url" do
      expect(model.time_url).to eq("http://thetvdb.com/api/Updates.php?type=none")
    end
  end
end
