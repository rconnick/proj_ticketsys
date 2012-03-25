Feature: activate a new account
  
  As an admin
  I want to be able to activate a new account
  So that the user can submit requests.

Background: a new account was created
  
  Given the user "Robert" is inactive
  And I am on the main page
  And I am logged in as "admin"

Scenario: activate the account "Robert"
  When I follow "View users"
  And I press "Edit user" for the user "Robert"
  And I press "Activate account"
  Then I should be editing the user "Robert"
  And I should see "The account has been activated"

Scenario: assign a user to be a service provider
  Given the user "Robert" is active
  And I am editing the user "Robert"
  When I change "Privilege" to "service_provider"
  Then I should be editing the user "Robert"
  And I should see "Robert is now assigned to be a service provider"