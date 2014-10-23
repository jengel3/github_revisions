module GithubRevisions
  module Generators
    class ViewsGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../../../../app/views/revisions', __FILE__)

      def copy_views
        filename_pattern = File.join self.class.source_root, "*.html.erb"
        Dir.glob(filename_pattern).map {|f| File.basename f}.each do |f|
          copy_file f, "app/views/revisions/#{f}"
        end
      end
    end
  end
end