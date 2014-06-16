Given /^I am on the homepage$/ do
  visit '/'
end

Then /^I should see .*"(.*?)"$/ do |text_seen|
  expect(page).to have_content(text_seen)
end

Given /^I view a givepage I created$/ do
  @page = FactoryGirl.create(:give_page, user:@current_user)
  visit give_page_path @page
end

When /^I click "(.*?)"$/ do |link_text|
  click_on link_text
end

Then /^I should be on the "(.*?)" page$/ do |content|
  expect(page).to have_css('.create_form')
end


Then /^I should be able to edit the (.+)$/ do |title|
  expect(page).to have_css('.edit_form')
end

When /^I view someone else's givepage$/ do
  user = FactoryGirl.create(:user, username: "jameses")
  @page = FactoryGirl.create(:give_page, user: user)
  visit give_page_path @page
end

Then /^I should see all of the page's data$/ do
  expect(page).to have_content @page.description
end

Then /^I should not be able to edit it$/ do
  expect(page).not_to have_css '.edit_form'
end
