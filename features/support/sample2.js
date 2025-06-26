
import { Given, When, Then } from "@cucumber/cucumber";
import { step } from "allure-js-commons";

// === GIVEN ===

// === WHEN ===

// === THEN ===
Then(`authorize as {string}`, async (login) => {
  await allure.parameter("auth_method", "password");
  await allure.parameter("login", login);
});
