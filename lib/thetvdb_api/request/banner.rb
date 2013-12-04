module ThetvdbApi
  module Request
    class Banner < ThetvdbApi::Request::Base
      def self.find(series_id)
        new(find_path(series_id))
      end

      def self.find_path(series_id)
        "#{ThetvdbApi::Configuration.api_key}/series/#{series_id}/banners.xml"
      end

      def initialize(uri)
        @uri = uri
      end

      def response
        @response ||= self.class.get(@uri, request_options)
      end

      def result
        @result ||= collection_response('Banner', ThetvdbApi::Banner)
      end

      private

      def data
        response['Banners']
      end
    end
  end
end
