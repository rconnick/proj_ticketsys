Feature: Closing a ticket
  As an admin
  I want to be able to close a ticket
  So that I can indicate that the problem has been taken care of

Background: there is an admin account
  And a ticket with the description "Broken stapler" exists
  Given I am logged on as "admin"    
  And I am on the My Tickets View page

Scenario: close the ticket
  Then I should see "Broken stapler"
  When I press "Close Ticket"
  Then I should see "Are you sure"
  And I press "OK"
  Then I should be on the home page
  And I should not see "Broken stapler"  

Scenario: start to close the ticket and then change my mind
  When I press "Close Ticket"
  Then I should see "Are you sure"
  And I press "Cancel"
  Then I should be on the home page
  And I should see "Broken stapler"  
