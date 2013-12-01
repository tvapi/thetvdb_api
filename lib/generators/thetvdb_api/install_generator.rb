module ThetvdbApi
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Creates a ThetvdbApi::Configuration initializer and copy locale files to your application.'
      def copy_initializer
        template 'thetvdb_api.rb', 'config/initializers/thetvdb_api.rb'
      end
    end
  end
end
