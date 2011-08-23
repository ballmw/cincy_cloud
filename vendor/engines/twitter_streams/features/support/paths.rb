module NavigationHelpers
  module Refinery
    module TwitterStreams
      def path_to(page_name)
        case page_name
        when /the list of twitter_streams/
          admin_twitter_streams_path

         when /the new twitter_stream form/
          new_admin_twitter_stream_path
        else
          nil
        end
      end
    end
  end
end
