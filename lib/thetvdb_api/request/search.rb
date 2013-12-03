module ThetvdbApi
  module Request
    class Search < ThetvdbApi::Request::Base
      def self.get_series(name, language = ThetvdbApi::Configuration.language)
        new('GetSeries.php', :series, seriesname: name, language: language)
      end

      def self.get_series_by_imdb_id(id, language = ThetvdbApi::Configuration.language)
        new('GetSeriesByRemoteID.php', :series, imdbid: id, language: language)
      end

      def self.get_series_by_zap2it_id(id, language = ThetvdbApi::Configuration.language)
        new('GetSeriesByRemoteID.php', :series, zap2it: id, language: language)
      end

      def self.get_episode_by_air_date(series_id, air_date, language = ThetvdbApi::Configuration.language)
        new('GetEpisodeByAirDate.php', :episode, apikey: ThetvdbApi::Configuration.api_key, seriesid: series_id,
          airdate: air_date, language: language)
      end

      def initialize(uri, map_to, options = {})
        @uri = uri
        @options = options
        @map_to = map_to
      end

      def response
        @response ||= self.class.get(@uri, request_options(@options))
      end

      def result
        @result ||= collection_response(map_node[@map_to], map_class[@map_to])
      end
    end
  end
end
