module ThetvdbApi
  module Request
    class Update < ThetvdbApi::Request::Base
      def self.day
        new(:day)
      end

      def self.week
        new(:week)
      end

      def self.month
        new(:month)
      end

      def self.all
        new(:all)
      end

      def initialize(period)
        @period = period
      end

      def path
        "#{ThetvdbApi::Configuration.api_key}/updates/updates_#{@period}.xml"
      end

      def response
        @response ||= self.class.get(path, request_options)
      end

      def series_response
        collection_response('Series', ThetvdbApi::Series)
      end

      def episodes_response
        collection_response('Episode', ThetvdbApi::Episode)
      end

      def banners_response
        collection_response('Banner', ThetvdbApi::Banner)
      end

      def result
        {
          series: series_response,
          episodes: episodes_response,
          banners: banners_response
        }
      end
    end
  end
end
