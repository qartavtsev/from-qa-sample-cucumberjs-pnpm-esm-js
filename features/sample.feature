Feature: Authentication

	Scenario: Scenario 1: Successful Login
 		Given the user is on the login page
   		When the user enters a valid username and password
     		When the user clicks the Login button
       		Then the user should be redirected to the dashboard page
	 	Then a success message should be displayed, saying Login successful

	Scenario: Scenario 2: Login with Invalid Credentials
 		Given the user is on the login page
   		When the user enters an invalid username or password
     		When the user clicks the Login button
       		Then an error message should be displayed, saying Invalid username or password
		Then the user should remain on the login page

	Scenario: Scenario 3: Login with Blank Fields
 		Given the user is on the login page
   		When the user clicks the Login button without entering a username or password
     		Then an error message should be displayed, saying Username and password cannot be blank

	Scenario: Scenario 4: Password Masking
		Given the user is on the login page
  		When the user enters a password in the password field
    		Then the password should be masked
      		Then the user should be able to toggle password visibility

	Scenario: Scenario 5: Account Lock after Multiple Failed Login Attempts
 		Given the user is on the login page
   		When the user enters invalid credentials multiple times
     		Then the account should be locked
       		Then a message should be displayed, saying Your account is locked. Please contact support

	Scenario: Scenario 6: Logout Functionality
 		Given the user is logged in
   		When the user clicks the Logout button
     		Then the user should be redirected to the login page
       		Then a message should be displayed, saying You have successfully logged out
	 	Then the session should be terminated

	Scenario: Scenario 7: Session Expiry
 		Given the user is logged in
   		Given the session timeout duration has elapsed
     		When the user attempts to perform any action
       		Then the user should be redirected to the login page
	 	Then a message should be displayed, saying Your session has expired. Please log in again
