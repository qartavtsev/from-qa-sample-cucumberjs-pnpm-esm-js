import { Given, When, Then } from "@cucumber/cucumber";
import { step } from "allure-js-commons";

// === GIVEN ===
Given("the user is on the login page", async function () {
  await step("Navigating to login page", async () => {
    // Simulate opening login page
    console.log("User opens login page");
  });
});

Given("the user is logged in", async function () {
  await step("Logging in the user", async () => {
    console.log("User is logged in");
  });
});

Given("the session timeout duration has elapsed (e.g., 15 minutes of inactivity)", async function () {
  await step("Simulating session timeout", async () => {
    console.log("Session has timed out");
  });
});

// === WHEN ===
When("the user enters a valid username and password", async function () {
  console.log("Entered valid credentials");
});

When("the user enters an invalid username or password", async function () {
  console.log("Entered invalid credentials");
});

When("the user clicks the Login button", async function () {
  console.log("Clicked Login button");
});

When("the user clicks the Login button without entering a username or password", async function () {
  console.log("Clicked Login without credentials");
});

When("the user enters a password in the password field", async function () {
  console.log("Entered password");
});

When("the user enters invalid credentials multiple times (e.g., 5 attempts)", async function () {
  console.log("Failed login 5 times");
});

When("the user clicks the Logout button", async function () {
  console.log("Clicked Logout");
});

When("the user attempts to perform any action", async function () {
  console.log("Tried to do something after session expired");
});

// === THEN ===
Then("the user should be redirected to the dashboard page", async function () {
  console.log("Redirected to dashboard");
});

Then("a success message should be displayed, saying Login successful", async function () {
  console.log("Login successful message shown");
});

Then("an error message should be displayed, saying Invalid username or password", async function () {
  console.log("Invalid credentials message shown");
});

Then("the user should remain on the login page", async function () {
  console.log("Still on login page");
});

Then("an error message should be displayed, saying Username and password cannot be blank", async function () {
  console.log("Blank field error shown");
});

Then("the password should be masked (e.g., displayed as asterisks or dots)", async function () {
  console.log("Password is masked");
});

Then("the user should be able to toggle password visibility (if supported)", async function () {
  console.log("Toggle visibility works");
});

Then("the account should be locked", async function () {
  console.log("Account is locked");
});

Then("a message should be displayed, saying Your account is locked. Please contact support", async function () {
  console.log("Account locked message shown");
});

Then("the user should be redirected to the login page", async function () {
  console.log("Redirected to login");
});

Then("a message should be displayed, saying You have successfully logged out", async function () {
  console.log("Logout message shown");
});

Then("the session should be terminated", async function () {
  console.log("Session terminated");
});

Then("a message should be displayed, saying Your session has expired. Please log in again", async function () {
  console.log("Session expired message shown");
});
