require 'spec_helper'

describe Buzz do

  def reset_buzz(options = {})
    @valid_attributes = {
      :id => 1,
      :search => "RSpec is great for testing too"
    }

    @buzz.destroy! if @buzz
    @buzz = Buzz.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_buzz
  end

  context "validations" do
    
    it "rejects empty search" do
      Buzz.new(@valid_attributes.merge(:search => "")).should_not be_valid
    end

    it "rejects non unique search" do
      # as one gets created before each spec by reset_buzz
      Buzz.new(@valid_attributes).should_not be_valid
    end
    
  end

end