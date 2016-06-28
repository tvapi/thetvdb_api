require "spec_helper"

class ThetvdbApi::Search < ThetvdbApi::Base
  def setup_adapter(connection)
    connection.adapter :test do |stub|
      stub.get("/api/GetSeries.php?seriesname=Supernatural") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/get_series.xml")]
      end
      stub.get("/api/GetSeriesByRemoteID.php?imdbid=tt0290978") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/get_series_by_remote.xml")]
      end
      stub.get("/api/GetSeriesByRemoteID.php?zap2it=SH01234") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/get_series_by_remote.xml")]
      end
      stub.get("/api/GetEpisodeByAirDate.php?airdate=2007-09-24&apikey=123456789&seriesid=80348") do
        [200, { content_type: "xml" }, File.read("spec/fixtures/get_episode.xml")]
      end
    end
  end
end

describe ThetvdbApi::Search do
  let(:client) { ThetvdbApi::Client.new(api_key: "123456789") }
  let(:model) { client.search }

  describe ".get_series" do
    it "returns Faraday::Response class" do
      expect(model.get_series(name: "Supernatural")).to be_a(Faraday::Response)
    end

    it "returns Hash class for body reponse" do
      expect(model.get_series(name: "Supernatural").body).to be_a(Hash)
    end
  end

  describe ".get_series_url" do
    it "returns correct url" do
      expect(
        model.get_series_url(name: "Supernatural")
      ).to eq("http://thetvdb.com/api/GetSeries.php?seriesname=Supernatural")
    end
  end

  describe ".get_series_by_remote_id" do
    context "with imdb_id" do
      it "returns Faraday::Response class" do
        expect(model.get_series_by_remote_id(imdb_id: "tt0290978")).to be_a(Faraday::Response)
      end

      it "returns Hash class for body reponse" do
        expect(model.get_series_by_remote_id(imdb_id: "tt0290978").body).to be_a(Hash)
      end
    end

    context "with zap2it_id" do
      it "returns Faraday::Response class" do
        expect(model.get_series_by_remote_id(zap2it_id: "SH01234")).to be_a(Faraday::Response)
      end

      it "returns Hash class for body reponse" do
        expect(model.get_series_by_remote_id(zap2it_id: "SH01234").body).to be_a(Hash)
      end
    end
  end

  describe ".get_series_by_remote_id_url" do
    context "with imdb_id" do
      it "returns correct url" do
        expect(
          model.get_series_by_remote_id_url(imdb_id: "tt0290978")
        ).to eq("http://thetvdb.com/api/GetSeriesByRemoteID.php?imdbid=tt0290978")
      end
    end

    context "with zap2it_id" do
      it "returns correct url" do
        expect(
          model.get_series_by_remote_id_url(zap2it_id: "SH01234")
        ).to eq("http://thetvdb.com/api/GetSeriesByRemoteID.php?zap2it=SH01234")
      end
    end
  end

  describe ".get_episode" do
    it "returns Faraday::Response class" do
      expect(model.get_episode(series_id: 80348, air_date: "2007-09-24")).to be_a(Faraday::Response)
    end

    it "returns Hash class for body reponse" do
      expect(model.get_episode(series_id: 80348, air_date: "2007-09-24").body).to be_a(Hash)
    end
  end

  describe ".get_episode_url" do
    it "returns correct url" do
      expect(
        model.get_episode_url(series_id: 80348, air_date: "2007-09-24")
      ).to eq("http://thetvdb.com/api/GetEpisodeByAirDate.php?apikey=123456789&seriesid=80348&airdate=2007-09-24")
    end
  end
end
