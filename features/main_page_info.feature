Feature: viewing the main page

  

Background: I am logged in

  Given I am logged in as "admin"
  And I am on the main page

Scenario: related users/service providers
  Then I should see "Additional users"
  And I should see "Additional service providers"

Scenario: date format
  Given that ticket 1 exists
  And ticket 1 was created on "2011-09-03"
  Then I should not see "2011-09-03"
  And I should see "September 3rd, 2011"
