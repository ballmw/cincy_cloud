class ServicesController < ActionController::Base
  def twitter
    @tweets = Twitter.user_timeline(RefinerySetting.find_or_set(:username, "username")).first(5)
    render :template => 'twitter.html.erb'
  end
end