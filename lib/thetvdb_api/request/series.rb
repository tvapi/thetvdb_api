module ThetvdbApi
  module Request
    class Series < ThetvdbApi::Request::Base
      def self.find(series_id, language = ThetvdbApi::Configuration.language)
        new(find_path(series_id, language), :base)
      end

      def self.find_full(series_id, language = ThetvdbApi::Configuration.language)
        new(find_full_path(series_id, language), :full)
      end

      def self.path_prefix(series_id)
        "#{ThetvdbApi::Configuration.api_key}/series/#{series_id}/"
      end

      def self.find_path(series_id, language)
        "#{path_prefix(series_id)}#{language}.xml"
      end

      def self.find_full_path(series_id, language)
        "#{path_prefix(series_id)}all/#{language}.xml"
      end

      def initialize(uri, map_to)
        @uri = uri
        @map_to = map_to
      end

      def response
        @response ||= self.class.get(@uri, request_options)
      end

      def result
        @result ||= case @map_to
          when :base
            series_response
          when :full
            full_response
        end
      end

      def series_response
        object_response('Series', ThetvdbApi::Series)
      end

      def episodes_response
        collection_response('Episode', ThetvdbApi::Episode)
      end

      def full_response
        {
          series: series_response,
          episodes: episodes_response
        }
      end
    end
  end
end
