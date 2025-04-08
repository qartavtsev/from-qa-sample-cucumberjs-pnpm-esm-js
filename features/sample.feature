Feature: authentication feature
	Scenario: Scenario 1: Successful Login
		Given the user is on the login page
		When the user enters a valid username and password
  		And clicks the Login button
    		Then the user should be redirected to the dashboard page
    		And a success message should be displayed, saying Login successful.



