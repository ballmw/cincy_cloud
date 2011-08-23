module Admin
  class TwitterStreamsController < Admin::BaseController

    crudify :twitter_stream,
            :title_attribute => 'username', :xhr_paging => true

  end
end
