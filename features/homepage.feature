Feature: Home page

  In order to have a nice homepage
  as a user
  it should be intuitive

  Scenario: The homepage has created pages on it
    Given I create a page with the title "Hello everyone"
    And I am on the homepage
    Then I should see the title "Hello everyone"

  Scenario: If I click the create a page link, I should be on the creation page
    Given that I am logged in
    And I am on the homepage
    And I click "Create a Page"
    Then I should be on the "Create a Page" page

  Scenario: I should be able to login
    Given that I am logged out
    And I am on the homepage
    When I login
    Then I should be logged in

  Scenario: I should be able to sign up
    Given I am on the homepage
    Then I should see the button "Sign Up"
