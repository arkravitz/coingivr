
Given /^that I am logged in$/ do
  visit '/'
  login
end

When /^I view someone else's givepage$/ do
  new_user = FactoryGirl.create(:user, username: "jameses", password: "hithere", password_confirmation: "hithere")
  @page = FactoryGirl.create(:give_page, user: new_user)
  visit give_page_path @page
end

Given /^I view a givepage I created$/ do
  @page = FactoryGirl.create(:give_page, user:@current_user)
  visit give_page_path @page
end

Then /^I should see all of the page's data$/ do
  expect(page).to have_content @page.description
end

Then /^I should not be able to edit it$/ do
  expect(page).not_to have_css '.edit_form'
end

Then /^I should be able to edit it$/ do
  expect(page).to have_css('.edit_form')
end

When /^I edit the givepage's title to "(.*?)"$/ do |title|
  fill_in "give_page_title", with: title
  click_on "Edit This Page"
end

Then /^the update should show on the main page$/ do
  pending
end

When /^I go to the homepage$/ do
  pending
end
