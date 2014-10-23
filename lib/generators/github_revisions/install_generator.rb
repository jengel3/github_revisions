module GithubRevisions
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      def copy_config_file
        template 'revisions_config.rb', 'config/initializers/revisions_config.rb'
      end
    end
  end
end