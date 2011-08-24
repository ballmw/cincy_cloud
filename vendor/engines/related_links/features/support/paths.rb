module NavigationHelpers
  module Refinery
    module RelatedLinks
      def path_to(page_name)
        case page_name
        when /the list of related_links/
          admin_related_links_path

         when /the new related_link form/
          new_admin_related_link_path
        else
          nil
        end
      end
    end
  end
end
