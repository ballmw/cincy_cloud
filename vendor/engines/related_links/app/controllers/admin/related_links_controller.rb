module Admin
  class RelatedLinksController < Admin::BaseController

    crudify :related_link,
            :title_attribute => 'name', :xhr_paging => true

  end
end
