module NavigationHelpers
  module Refinery
    module Buzzs
      def path_to(page_name)
        case page_name
        when /the list of buzzs/
          admin_buzzs_path

         when /the new buzz form/
          new_admin_buzz_path
        else
          nil
        end
      end
    end
  end
end
