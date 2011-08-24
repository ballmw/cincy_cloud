
class TwitterStreamsController < ApplicationController

  before_filter :find_all_twitter_streams
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @twitter_stream in the line below:
    present(@page)
  end

  def show
    
    @twitter_stream = TwitterStream.find(params[:id])
    #puts @twitter_stream.username
    #puts @twitter_stream.num_to_display
    twitter = Twitter::Client.new()
    @tweets = twitter.user_timeline(@twitter_stream.username).first(@twitter_stream.num_to_display)
    
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @twitter_stream in the line below:
#    present(@page)
    render :layout => false
  end

protected

  def find_all_twitter_streams
    @twitter_streams = TwitterStream.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/twitter_streams").first
  end

end
