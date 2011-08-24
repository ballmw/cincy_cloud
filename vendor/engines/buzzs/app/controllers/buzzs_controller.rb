class BuzzsController < ApplicationController

  before_filter :find_all_buzzs
  before_filter :find_page

  def index
    @buzzs = find_all_buzzs
    @tweets = []
    
    puts ENV['APIGEE_TWITTER_API_ENDPOINT']
    if(ENV['APIGEE_TWITTER_API_ENDPOINT'])
      Twitter.configure do |config|
        config.endpoint = 'http://' +ENV['APIGEE_TWITTER_API_ENDPOINT']
        config.search_endpoint = 'http://' +ENV['APIGEE_TWITTER_SEARCH_API_ENDPOINT']
      end
    end
    
    search = Twitter::Search.new
    @buzzs.each { |buzz|
      @tweets += search.containing(buzz.search).fetch
    }
    
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @buzz in the line below:
    #present(@page)
    render :layout => false
  end

  def show
    @buzz = Buzz.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @buzz in the line below:
    #present(@page)
    render :layout => false
  end

protected

  def find_all_buzzs
    @buzzs = Buzz.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/buzzs").first
  end

end
