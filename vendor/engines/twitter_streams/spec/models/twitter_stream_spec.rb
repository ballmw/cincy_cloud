require 'spec_helper'

describe TwitterStream do

  def reset_twitter_stream(options = {})
    @valid_attributes = {
      :id => 1,
      :username => "RSpec is great for testing too"
    }

    @twitter_stream.destroy! if @twitter_stream
    @twitter_stream = TwitterStream.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_twitter_stream
  end

  context "validations" do
    
    it "rejects empty username" do
      TwitterStream.new(@valid_attributes.merge(:username => "")).should_not be_valid
    end

    it "rejects non unique username" do
      # as one gets created before each spec by reset_twitter_stream
      TwitterStream.new(@valid_attributes).should_not be_valid
    end
    
  end

end