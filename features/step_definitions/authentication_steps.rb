Given /^that I am logged out$/ do
  @current_user = nil
end

Given /^that I am the creator of the current page$/ do
  @page_creator = FactoryGirl.create(:user)
  @page = FactoryGirl.create(:givepage)
end

def login
  @current_user = FactoryGirl.create(:user)
  fill_in "username", with: @current_user.username
  fill_in "password", with: @current_user.password
  click_on 'Login'
end

When /^I login$/ do
  login
end

Given /^that I am logged in$/ do
  visit '/'
  login
end

Then /^I should be logged in$/ do
  expect(page).not_to have_content("Login")
end
