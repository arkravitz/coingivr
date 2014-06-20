Feature: Viewing a page I created

  Scenario: As the creator of the page, I should be able to edit it
    Given that I am logged in
    When I view a givepage I created
    Then I should be able to edit it

  Scenario: If I'm not the creator of the page, I shouldn't be able to edit it
    Given that I am logged in
    When I view someone else's givepage
    Then I should see all of the page's data
    And I should not be able to edit it

  Scenario: If I edit the page, it should update my info
    Given that I am logged in
    When I view a givepage I created
    And I edit the givepage's title to "This is an edit"
    And I go to the homepage
    Then I should see the title "This is an edit"
