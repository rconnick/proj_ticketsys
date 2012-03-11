Feature: filter by parameter

As a User
I want to be able to filter by date, status, notes, etc
So that I can easily access the proper ticket info

Background: tickets in system

Given "Josh" is logged on 
And I am on the "Ticket View" page
And the following tickets exist:

| title             | creator | create_date | status | 
| Broken Printer    | Josh    | 2012-03-01  | closed |
| No Paper Towels   | Josh    | 2012-03-12  | open   |
| Microwave on fire | Josh    | 2009-07-23  | open   |

Scenario: filter by status

When I check the "Show Closed Tickets" checkbox
And I uncheck the "Show Open Tickets" checkbox
And I press "Update"
Then I should be on the "Ticket View" page
And I should see "Broken Printer"
And I should not see "No Paper Towels"
And I should not see "Microwave on fire"

Scenario: filter by date

When I fill in "Start Date" with "2012-03-01"
And I fill in "End Date" with "2012-03-15"
And I press "Update"
Then I should be on the "Ticket View" page
And I should see "Broken Printer"
And I should see "No Paper Towels"
And I should not see "Microwave on fire"

