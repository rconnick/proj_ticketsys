Feature: View Tickets
  As a user
  I want to access open/closed tickets
  So that I can track open/closed issues

Background: there is a user account
  Given I am logged on as "user"
  And opened ticket with the description "Broken stapler" exists
  And closed ticket with the description "Fixed stapler" exists
  And I am on the home page

Scenario: view opened tickets
  Then I should see "Broken stapler"
  When I follow "Broken stapler"
  Then I should be on the View Ticket page
  And I should see "Opened"

Scenario: view closed tickets
  Then I should see "Fixed stapler"
  When I follow "Fixed stapler"
  Then I should be on the View Ticket page
  And I should see "Closed"
