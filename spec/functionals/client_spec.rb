require "spec_helper"

class ThetvdbApi::Client < ThetvdbApi::Base
  def setup_adapter(connection)
    connection.adapter :test do |stub|
      stub.get("/api/Updates.php?type=none") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/server_time.xml")]
      end
    end
  end
end

describe ThetvdbApi::Client do
  let(:client) { ThetvdbApi::Client.new(api_key: "123456789") }

  describe ".get" do
    it "returns Faraday::Response class" do
      expect(client.get("/api/Updates.php?type=none")).to be_a(Faraday::Response)
    end

    it "returns Hash class for body reponse" do
      expect(client.get("/api/Updates.php?type=none").body).to be_a(Hash)
    end
  end
end
