Given /^I have no related_links$/ do
  RelatedLink.delete_all
end

Given /^I (only )?have related_links titled "?([^\"]*)"?$/ do |only, titles|
  RelatedLink.delete_all if only
  titles.split(', ').each do |title|
    RelatedLink.create(:name => title)
  end
end

Then /^I should have ([0-9]+) related_links?$/ do |count|
  RelatedLink.count.should == count.to_i
end
