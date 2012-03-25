Feature: closing a ticket
  
  As a user/service provider
  I want to be able to close my ticket
  So that I can communicate my satisfaction.

Background: I have created a ticket
  
  Given the user "Robert" exists
  And ticket 1 exists created by "Robert"
  And ticket 1 is owned by "Bronwyn"
  And I am logged in as "Robert"

Scenario: close my ticket
  Given I am viewing ticket 1
  And ticket 1 is open
  When I press "Close"
  And I press "Submit"
  Then ticket 1 should be closed

Scenario: try to close someone else's ticket
  Given ticket 2 exists created by "William"
  And I am viewing ticket 2
  And ticket 2 is open
  When I press "Close"
  Then I should be viewing ticket 2
  And ticket 2 should be open
  And I should see "You may only close your own tickets"

Scenario: reopen my ticket
  Given I am viewing ticket 1
  And ticket 1 is closed
  When I press "Reopen"
  Then ticket 1 should be open

Scenario: try to reopen someone else's ticket
  Given ticket 2 exists created by "William"
  And I am viewing ticket 2
  And ticket 2 is closed
  When I press "Reopen"
  Then I should be viewing ticket 2
  And ticket 2 should be closed
  And I should see "You may only reopen your own tickets"

Scenario: close my ticket as a service provider
  Given I am logged in as "Bronwyn"
  And I am viewing ticket 1
  And ticket 1 is open
  When I press "Close"
  And I press "Submit"
  Then ticket 1 should be closed

Scenario: reopen my ticket a service provider
  Given I am logged in as "Bronwyn"
  And I am viewing ticket 1
  And ticket 1 is closed
  When I press "Reopen"
  Then ticket 1 should be open
