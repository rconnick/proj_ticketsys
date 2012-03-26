Feature:  View Tickets
  As an admin
  I want to easily be able to access/search for all tickets by a variety of parameters
  So that I can monitor progress and reference past issues

Background: there is an admin account
  Given I am logged on as "admin"    
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
