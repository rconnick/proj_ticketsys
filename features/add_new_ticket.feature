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

Scenario: see service are and ticket type fields
  Given I am on the New Ticket page
  I should see "Service area"
  When I change "Service area" to "IT"
  Then I should see "Ticket type"

Scenario: automatically assign a service provider
  Given that the service provider "Shayne" exists in the service area "IT"
  When I create the ticket 1 with a service area of "IT"
  And I am viewing ticket 1
  Then I should see "Shayne"
