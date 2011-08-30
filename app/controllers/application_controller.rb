class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  before_filter :find_all_related_links
  
  protected

  
  
  def find_all_related_links
    @related_links = RelatedLink.order('position ASC')
  end
  
  #cache_method :find_all_related_links, (60*5)
  
end
