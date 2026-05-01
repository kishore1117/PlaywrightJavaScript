Feature: login functionality

Scenario: login successfull
Given when the user navigates to login page
When the user enters valid username "standard_user" and valid password "secret_sauce"
Then user should be able to view the inventory page


Scenario Outline: Invalid login
Given when the user navigates to login page
When the user enters invalid username "<username>" and invalid password "<password>"
Then user should see the error message "Epic sadface: Username and password do not match any user in this service" 
Examples:
| username       | password       |
| invalid_user   | secret_sauce   |
| standard_user  | invalid_pass   |