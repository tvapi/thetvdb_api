module ThetvdbApi
  module Request
    module Module
      module Find
        def self.included(base)
          base.extend(ClassMethods)
        end

        module ClassMethods
          def find(series_id)
            new(find_path(series_id))
          end
        end
      end
    end
  end
end