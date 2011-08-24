class RelatedLinksController < ApplicationController

  before_filter :find_all_related_links
  before_filter :find_page

  def index
    
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @related_link in the line below:
    present(@page)
  end

  def show
    @related_link = RelatedLink.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @related_link in the line below:
    present(@page)
  end

protected

  def find_all_related_links
    @related_links = RelatedLink.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/related_links").first
  end

end
