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

Then /^I should be able to sign up$/ do
  expect do
    user_attrs = FactoryGirl.attributes_for(:user)
    fill_in "user_full_name", with: user_attrs[:full_name]
    fill_in "user_username", with: user_attrs[:username]
    fill_in "user_email", with: user_attrs[:email]
    fill_in "user_password", with: user_attrs[:password]
    fill_in "user_password_confirmation", with: user_attrs[:password]
    click_on "Sign Up"
  end.to change{User.count}.by(1)
end
