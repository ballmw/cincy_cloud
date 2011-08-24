module Admin
  class BuzzsController < Admin::BaseController

    crudify :buzz,
            :title_attribute => 'search', :xhr_paging => true

  end
end
