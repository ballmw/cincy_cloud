Given /^I have no buzzs$/ do
  Buzz.delete_all
end

Given /^I (only )?have buzzs titled "?([^\"]*)"?$/ do |only, titles|
  Buzz.delete_all if only
  titles.split(', ').each do |title|
    Buzz.create(:search => title)
  end
end

Then /^I should have ([0-9]+) buzzs?$/ do |count|
  Buzz.count.should == count.to_i
end
