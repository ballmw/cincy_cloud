require 'spec_helper'

describe RelatedLink do

  def reset_related_link(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @related_link.destroy! if @related_link
    @related_link = RelatedLink.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_related_link
  end

  context "validations" do
    
    it "rejects empty name" do
      RelatedLink.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_related_link
      RelatedLink.new(@valid_attributes).should_not be_valid
    end
    
  end

end