module ThetvdbApi
  module Request
    class Episode < ThetvdbApi::Request::Base
      def self.find_by_default_order(series_id, season, episode, language = ThetvdbApi::Configuration.language)
        new(find_by_default_order_path(series_id, season, episode, language))
      end

      def self.find_by_dvd_order(series_id, season, episode, language = ThetvdbApi::Configuration.language)
        new(find_by_dvd_order_path(series_id, season, episode, language))
      end

      def self.find_by_absolute_order(series_id, absolute, language = ThetvdbApi::Configuration.language)
        new(find_by_absolute_order_path(series_id, absolute, language))
      end

      def self.find(episode_id, language = ThetvdbApi::Configuration.language)
        new(find_path(episode_id, language))
      end

      def self.path_prefix(series_id)
        "#{ThetvdbApi::Configuration.api_key}/series/#{series_id}/"
      end

      def self.find_by_default_order_path(series_id, season, episode, language)
        "#{path_prefix(series_id)}default/#{season}/#{episode}/#{language}.xml"
      end

      def self.find_by_dvd_order_path(series_id, season, episode, language)
        "#{path_prefix(series_id)}dvd/#{season}/#{episode}/#{language}.xml"
      end

      def self.find_by_absolute_order_path(series_id, absolute, language)
        "#{path_prefix(series_id)}absolute/#{absolute}/#{language}.xml"
      end

      def self.find_path(episode_id, language)
        "#{ThetvdbApi::Configuration.api_key}/episodes/#{episode_id}/#{language}.xml"
      end

      def initialize(uri)
        @uri = uri
      end

      def response
        @response ||= self.class.get(@uri, request_options)
      end

      def result
        @result ||= object_response('Episode', ThetvdbApi::Episode)
      end
    end
  end
end
