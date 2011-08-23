Given /^I have no twitter_streams$/ do
  TwitterStream.delete_all
end

Given /^I (only )?have twitter_streams titled "?([^\"]*)"?$/ do |only, titles|
  TwitterStream.delete_all if only
  titles.split(', ').each do |title|
    TwitterStream.create(:username => title)
  end
end

Then /^I should have ([0-9]+) twitter_streams?$/ do |count|
  TwitterStream.count.should == count.to_i
end
