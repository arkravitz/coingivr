Given /^that I am logged out$/ do
  @current_user = nil
end

When /^I login$/ do
  login
end

Then /^I should be logged in$/ do
  expect(page).not_to have_content("Login")
end

Given /^I create a page(?: with the title "(.*)")$/ do |title|
  title ||= 'Random Title'
  @current_user ||= FactoryGirl.create(:user)
  @page = FactoryGirl.create(:give_page, title: title, user:@current_user)
end

Then /^I should see(?: the title) "(.*?)"$/ do |text_seen|
  expect(page).to have_content(text_seen)
end

When /^I click "(.*?)"$/ do |link_text|
  click_on link_text
end

Then /^I should see the button "(.*?)"$/ do |button|
  expect(page).to have_button(button)
end

Then /^I should be on the "(.*?)" page$/ do |content|
  expect(page).to have_css('.create_form')
end

Given /^I am on the homepage$/ do
  visit '/'
end

