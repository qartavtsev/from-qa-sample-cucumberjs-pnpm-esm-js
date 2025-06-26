Feature: Basic Group
    Basic Group Identity BDD cases

  Background:
    Given user is logged in with user role "Publisher Super Admin"

  @Full_Essential_Delete @Regression-BDD
  Scenario Outline: Delete Full Essential Data - Basic Group
    When user performs "delete" a "basic group" operation with parameters "<identityDescription>" and "<identityCode>"

    Examples:
      | identityDescription | identityCode |
      | basicGroupTest | code:basicGroup.invalid |
      | basicGroupTestUpdate | code:basicGroup.invalid |
      | basicGroupTestDelete | code:basicGroupDelete.invalid |
