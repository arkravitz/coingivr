Given /^that I have created a page with the title "([^\"]*)"$/ do |title|
  @page = FactoryGirl.create(:give_page, title: title)
end

Given /^I create a page(?: with the title "(.*)")$/ do |title|
  title ||= 'Random Title'
  @current_user ||= FactoryGirl.create(:user)
  @page = FactoryGirl.create(:give_page, title: title, user:@current_user)
end
