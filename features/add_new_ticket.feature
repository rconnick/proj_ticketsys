Feature: Add a new ticket
  As a User
  I want to be able open a new ticket
  So that I can request a needed service

Background: tickets in system
  Given "Joe" is logged on as "admin"
  And I am on the Ticket View page   

Scenario: add ticket
  Then I should see "New Ticket"  
  When I follow "New Ticket"
  Then I should be on the New Ticket page
  When I fill in "Description" with "Broken Computer"
  And I press "Submit Ticket"
  Then I should be on the home page
  And I should see "Broken Computer"

Scenario: add ticket without a description
  Then I should see "New Ticket"  
  When I follow "New Ticket"
  Then I should be on the New Ticket page  
  When I press "Submit Ticket"
  Then I should be on the New Ticket page
  And I should see "Incomplete Ticket "