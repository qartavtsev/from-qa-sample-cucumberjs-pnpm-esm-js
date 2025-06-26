import { Given, When, Then } from "@cucumber/cucumber";
import { step } from "allure-js-commons";

// === GIVEN ===
Given(`user is logged in with user role "Publisher Super Admin"`, async function () {
  await step("action", async () => {
    console.log("action");
  });
});

// === WHEN ===
When('user performs "delete" a "basic group" operation with parameters {string} and {string}', async (identityDescription, identityCode) => {
      await allure.parameter("identityDescription", identityDescription);
      await allure.parameter("identityCode", identityCode);
});
