Feature: create a new account
  As a User
  I want to be able to set up an account, pending Admin approval
  So that the entry process can be streamlined.

Background: user does not exist
  Given the user "Robert" does not exist
  And I am on the Login page
  And I am not logged in

Scenario: create a new account named "Robert"
  When I follow "Create a new account"
  Then I should be on the Create a new account page
  When I fill in "Name" with "Robert"
  And I press "Submit"
  Then I should be on the Login page
  And I should see "Your account has been created pending admin approval"

# We probably don't need this as it is taken care of in the login.feature
Scenario: try to login with a non-existent account
  When I fill in "Username" with "Robert"
  And I fill in "Password" with "Secret"
  And I press "Login"
  Then I should be on the Login page
  And I should see "Invalid username/password"

# We probably don't need this as it is taken care of in the login.feature
Scenario: login with an existing account
  Given the user "Robert" exists with the password "Secret"
  When fill in "Username" with "Robert"
  And I fill in "Password" with "Secret"
  And I press "Login"
  Then I should be on the main page
