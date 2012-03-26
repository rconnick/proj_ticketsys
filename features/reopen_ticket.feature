Feature: Reopen a ticket
  As a user/service provider
  I want to be able to reopen an old ticket
  So that one can revisit and fix a potentially unfinished request

Background: there is an admin account
  And a ticket with the description "Broken stapler" exists
  Given I am logged on as "admin"    
  And I am on the My Tickets View page

Scenario: reopen the ticket
  Then I should see "Broken stapler"
  When I press "Re-Open Ticket"
  Then I should see "Are you sure"
  And I press "OK"
  Then I should be on the home page
  And I should see "Broken stapler"  

Scenario: start to Re-Open the ticket and then change my mind
  When I press "Re-Open Ticket"
  Then I should see "Are you sure"
  And I press "Cancel"
  Then I should be on the home page
  And I should not see "Broken stapler"  
