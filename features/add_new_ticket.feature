Feature: Add a new ticket

As a User
I want to be able open a new ticket
So that I can request a needed service

Background: tickets in system

  Given "Joe" is logged on
  And I am a user
  And I am on the "Ticket View" page
  And the following tickets exist:

| title             | creator   | create_date | status |
| Broken Printer    | Josh      | 2012-03-01  | closed |
| No Paper Towels   | Josh      | 2012-03-12  | open   |
| Microwave on fire | Josh      | 2009-07-23  | open   |

Scenario: add ticket

  When I click "New Ticket"
  I should be on the "New Ticket Page"
  When I fill in name with "Broken Computer"
  And I click "Send New Ticket"
  I should be on the "Ticket View" page
  And I should see "Broken Computer"
