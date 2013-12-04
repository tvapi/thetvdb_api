module ThetvdbApi
  module Request
    class Actor < ThetvdbApi::Request::Base
      def self.find(series_id)
        new(find_path(series_id))
      end

      def self.find_path(series_id)
        "#{ThetvdbApi::Configuration.api_key}/series/#{series_id}/actors.xml"
      end

      def initialize(uri)
        @uri = uri
      end

      def response
        @response ||= self.class.get(@uri, request_options)
      end

      def result
        @result ||= collection_response('Actor', ThetvdbApi::Actor)
      end
    end
  end
end
