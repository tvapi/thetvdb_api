module ThetvdbApi
  module Request
    module Module
      module SeriesUri
        def self.included(base)
          base.extend(ClassMethods)
        end

        module ClassMethods
          def series_uri(series_id)
            "#{ThetvdbApi::Configuration.api_key}/series/#{series_id}/"
          end
        end
      end
    end
  end
end