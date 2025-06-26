Feature: Basic Group
    Basic Group Identity BDD cases

  Background:
    Given user is logged in with user role "Publisher Super Admin"

  @Full_Essential_Delete @Regression-BDD
  Scenario Outline: Delete Full Essential Data - Basic Group
    When user performs "delete" a "basic group" operation with parameters
          | identityDescription   | identityCode |
          | <identityDescription> | <identityCode> |

    Examples:
      | identityDescription | identityCode |
      | basicGroupTest | code:basicGroup.invalid |
      | basicGroupTestUpdate | code:basicGroup.invalid |
      | basicGroupTestDelete | code:basicGroupDelete.invalid |

  @Regression-BDD
  Scenario: Create Basic Group Identity
    Given user sets the fields for identity of type "Basic Group"
                    | userCode                | description   | type |
                    | code:basicGroup.invalid | basicGroupTest  | Basic Group |
    When user "Create" identity of type "Basic Group"
    Then identity of type "Basic Group" details appear successfully

  @Regression-BDD
  Scenario: Search Basic Group Identity
    Given user sets the fields for identity of type "Basic Group"
      | userCode                | description    | type |
      | code:basicGroup.invalid | basicGroupTest | Basic Group |
    When user "Search" identity of type "Basic Group"
    Then identity of type "Basic Group" details appear successfully

  @Regression-BDD
  Scenario: Update Basic Group Identity
    Given user sets the fields for identity of type "Basic Group"
      | userCode                | description   | type |
      | code:basicGroup.invalid | basicGroupTest | Basic Group |
    And user "Search" identity of type "Basic Group"
    When user sets the fields for identity of type "Basic Group"
      | description           | userCode                      | type |
      | basicGroupTestUpdate  | code:basicGroupUpdate.invalid | Basic Group |
    And user "Update" identity of type "Basic Group"
    Then identity of type "Basic Group" details appear successfully

  @Smoke @Regression-BDD
  Scenario: Delete Basic Group
    Given user sets the fields for identity of type "Basic Group"
      | userCode                      | description          | type |
      | code:basicGroupDelete.invalid | basicGroupTestDelete | Basic Group |
    And user "Create" identity of type "Basic Group"
    When user "Delete" identity of type "Basic Group"
    Then identity of type "Basic Group" is deleted successfully

  @Regression-BDD
  Scenario: Update Basic Group Identity - Add Address
    Given user sets the fields for identity of type "Basic Group"
                    | userCode              | description   | type |
                    | code:BG Create Address | Auto BG group | Basic Group |
    And user "Create" identity of type "Basic Group"
    When user sets address fields to identity of type "Basic Group"
                    | description | organization | department  | address_1 | address_2   | city   | state  | zip_code | countries | phone      | ext  | fax |
                    | basic group     | Atypon       | Engineering | Antypa 80 | Kifisias 93 | Athens | Greece | 123 | Jordan    | 6977415195 | 1234 | 6977415195 |
    And user adds the address to identity of type "Basic Group"
    Then address is added successfully to identity of type "Basic Group"
    When user "Search" identity of type "Basic Group"
    Then address is added successfully to identity of type "Basic Group"

  @Regression-BDD
  Scenario: Update Basic Group Identity - Update Address
    Given user sets the fields for identity of type "Basic Group"
             | userCode              | description   | type |
             | code:BG Create Address | Auto BG group | Basic Group |
    And user "Search" identity of type "Basic Group"
    Given user sets address fields to identity of type "Basic Group"
             | description | organization | department  | address_1 | address_2   | city   | state  | zip_code | countries | phone      | ext  | fax |
             | basic group update | Atypon       | Engineering | Antypa 80 | Kifisias 93 | Athens | Greece | 123 | Jordan    | 6977415195 | 1234 | 6977415195 |
    When user updates identity address with description "basic group" for identity of type "Basic Group"
    And user "Search" identity of type "Basic Group"
    Then address is added successfully to identity of type "Basic Group"

  @Regression-BDD
  Scenario: Update Basic Group Identity - Remove Address
    Given user sets the fields for identity of type "Basic Group"
                    | userCode              | description   | type |
                    | code:BG Create Address | Auto BG group | Basic Group |
    And user "Search" identity of type "Basic Group"
    And user sets address fields to identity of type "Basic Group"
                    | description | organization | department  | address_1 | address_2   | city   | state  | zip_code | countries | phone      | ext  | fax |
                    | basic group update   | Atypon       | Engineering | Antypa 80 | Kifisias 93 | Athens | Greece | 123 | Jordan    | 6977415195 | 1234 | 6977415195 |
    When user removes the address from identity of type "Basic Group"
    When user "Search" identity of type "Basic Group"
    Then address is removed successfully from identity of type "Basic Group"

  @Regression-BDD
  Scenario: Update Basic Group Identity - Add License
    Given user sets the fields for content bundles
             | description | code | component | type | operation |
                   | Auto-bundle-BG | autoBG | All | Content Bundles | search |
    And user "Create" content bundles
    Given user sets the fields for content slice of type "Issue Range"
              | description | code | fromVolume | fromIssue | toVolume | toIssue | area | issueTypes | bundleCode | type |
              | basic group Automation create issue range  | code:bg auto create issue range | 1 | 1 | 2 | 2 | Staging | All | autoBG| Issue Range |
    And content bundle is associated to content slice of type "Issue Range"
    And user "Create" content slice of type "Issue Range"
    Given user sets the fields for offer of type "Standard Offer"
             | description | displayTitle | offerCode | availableFrom  | availableTo | type |
             | automation create standard offer basic group | auto create offer bg| autoBGcrawler | 2018-02-07 | 2026-03-28  | Standard Offer |
    When content Slice of type "Issue Range" is associated to offer of type "Standard Offer"
    And user "Create" offer of type "Standard Offer"
    Given user sets the fields for identity of type "Basic Group"
                    | userCode           | description   | type |
                    | code:BG Add License | Auto BG group | Basic Group |
    And user "Create" identity of type "Basic Group"
    When user sets license fields to identity of type "Basic Group"
             | description | offerCode  | displayTitle| offerType |
             | automation create standard offer basic group | autoBGcrawler | auto create offer bg| Standard Offer |
    And user adds offer of type "Standard Offer" to identity of type "Basic Group"
    Then verify offer of type "Standard Offer" added to "Basic Group" and displaying on "Table,List"

  @Regression-BDD
  Scenario: Update Basic Group Identity - Edit License
    Given user sets the fields for identity of type "Basic Group"
                    | userCode           | description   | type |
                    | code:BG Add License | Auto BG group | Basic Group |
    And user "Search" identity of type "Basic Group"
    When user sets license fields to identity of type "Basic Group"
              | startDate | expirationDate | endDate | comment | offerCode | offerType | displayTitle |
             | 2017-12-19 | 2025-12-19 | 2030-12-19 | edit license auto test | autoBGcrawler| Standard Offer| auto create offer bg |
    And user edits the license of type "Standard Offer" from identity of type "Basic Group"
    Then verify "Standard Offer" added to "Basic Group"

  @Regression-BDD
  Scenario: Update Basic Group Identity - Remove License
    Given user sets the fields for identity of type "Basic Group"
                    | userCode           | description   | type |
                    | code:BG Add License | Auto BG group | Basic Group |
    And user "Search" identity of type "Basic Group"
    And user sets license fields to identity of type "Basic Group"
             | startDate | expirationDate | endDate | comment | offerCode | offerType | displayTitle |
             | 2017-12-19 | 2025-12-19 | 2030-12-19 | edit license auto test | autoBGcrawler| Standard Offer| auto create offer bg |
    When user removes license of type "Standard Offer" from identity of type "Basic Group"
    Then License of "Standard Offer" type is removed successfully from "Basic Group"
    And "Standard Offer" type is removed successfully from "Basic Group" license list of "code:BG Add License"

  @Regression-BDD
  Scenario: Update Basic Group Identity - Add Group
    Given user sets the fields for identity of type "Basic Group"
                    | userCode              | description   | type |
                    | code:BG Add Group of basic group type | Auto BG group | Basic Group |
    And user "Create" identity of type "Basic Group"
    When user sets fields of group of type "Basic Group" to identity of type "Basic Group"
             | userCode | description  | type  | operation |
             | code:BG Group Add | QA Test Group | Basic Group  | create |
    And user adds the group to identity of type "Basic Group"
    Then group is added successfully to identity of type "Basic Group"
    When user "Search" identity of type "Basic Group"
    Then group is added successfully to identity of type "Basic Group"

  @Regression-BDD
  Scenario: Update Basic Group Identity - Update Group
    Given user sets the fields for identity of type "Basic Group"
             | userCode              | description   | type |
             | code:BG Add Group of basic group type | Auto BG group | Basic Group |
    And user "Search" identity of type "Basic Group"
    When user sets fields of group of type "Basic Group" to identity of type "Basic Group"
              | userCode | description  | type  | operation |
              | code:BG Group Add | QA Test Group update | Basic Group  | create |
    Then user updates group with description "QA Test Group" for identity of type "Basic Group"
    When user "Search" identity of type "Basic Group"
    Then group is added successfully to identity of type "Basic Group"

  @Regression-BDD
  Scenario: Update Basic Group Identity - Remove Group
    Given user sets the fields for identity of type "Basic Group"
                    | userCode              | description   | type |
                    | code:BG Add Group of basic group type | Auto BG group | Basic Group |
    And user "Search" identity of type "Basic Group"
    And user sets fields of group of type "Basic Group" to identity of type "Basic Group"
              | userCode | description  | type  | operation |
              | code:BG Group Add | QA Test Group update | Basic Group  | create |
    When user removes the group from identity of type "Basic Group"
    Then group of type "Basic Group" is removed successfully from identity of type "Basic Group"
    When user "Search" identity of type "Basic Group"
    Then group of type "Basic Group" is removed successfully from identity of type "Basic Group"

  @Regression-BDD
  Scenario: Update Basic Group Identity - Add Combined Group
    Given user sets the fields for identity of type "Basic Group"
                    | userCode                  | description   | type |
                    | code:BG Add Combined Group | Auto BG group | Basic Group |
    And user "Create" identity of type "Basic Group"
    When user sets combined group fields to identity of type "Basic Group"
                    | userCode              | description       | type     | operation |
                    | code:Combined Group BG Add | Combined Group BG | Combined | create |
    And user adds the combined group to identity of type "Basic Group"
    Then combined group is added successfully to identity of type "Basic Group"
    When user "Search" identity of type "Basic Group"
    Then combined group is added successfully to identity of type "Basic Group"

  @Regression-BDD
  Scenario: Update Basic Group Identity - Update Combined Group
    Given user sets the fields for identity of type "Basic Group"
                    | userCode                  | description   | type |
                    | code:BG Add Combined Group | Auto BG group | Basic Group |
    And user sets combined group fields to identity of type "Basic Group"
                    | userCode              | description       | type     | operation |
                    | code:Combined Group BG Add | Combined Group BG | Combined | create |
    And user "Search" identity of type "Basic Group"
    When user sets combined group fields to identity of type "Basic Group"
                    | userCode              | description       | type     | operation |
                    | code:Combined Group BG Add | Combined Group BG update | Combined | create |
    And user updates combined group with description "Combined Group BG" for identity of type "Combined"
    When user "Search" identity of type "Basic Group"
    Then combined group is added successfully to identity of type "Basic Group"

  @Regression-BDD
  Scenario: Update Basic Group Identity - Remove Combined Group
    Given user sets the fields for identity of type "Basic Group"
                    | userCode                  | description   | type |
                    | code:BG Add Combined Group | Auto BG group | Basic Group |
    And user "Search" identity of type "Basic Group"
    And user sets combined group fields to identity of type "Basic Group"
                    | userCode              | description       | type     | operation |
                    | code:Combined Group BG Add | Combined Group BG update | Combined | create |
    When user removes the combined group from identity of type "Basic Group"
    Then combined group is removed successfully from identity of type "Basic Group"
    When user "Search" identity of type "Basic Group"
    Then combined group is removed successfully from identity of type "Basic Group"

  @Regression-BDD
  Scenario: Update Basic Group Identity - Add Member
    Given user sets the fields for identity of type "Basic Group"
                    | userCode      | description   | type |
                    | code:BG Crud add member | Auto BG group add member | Basic Group |
    When user "Create" identity of type "Basic Group"
    When user sets identity member of type "Basic Group" fields to identity of type "Basic Group"
                    | userCode | description   | type | operation |
                    | code:BG add member basic group | BG QA Test member | Basic Group | create |
    And user adds identity member of type "Basic Group" to identity of type "Basic Group"
    Then member is added successfully to identity of type "Basic Group"
    When user "Search" identity of type "Basic Group"
    Then member is added successfully to identity of type "Basic Group"

  @Regression-BDD
  Scenario: Update Basic Group Identity - Update Member
    Given user sets the fields for identity of type "Basic Group"
                    | userCode      | description   | type |
                    | code:BG Crud add member | Auto BG group add member | Basic Group |
    When user "Search" identity of type "Basic Group"
    When user sets identity member of type "Basic Group" fields to identity of type "Basic Group"
                    | userCode | description   | type | operation |
                    | code:BG add member basic group | BG QA Test member update | Basic Group | search |
    And user updates identity member with description "Auto BG group add member" for identity of type "Basic Group"
    When user "Search" identity of type "Basic Group"
    Then member is added successfully to identity of type "Basic Group"

  @Regression-BDD
  Scenario: Update Basic Group Identity - Remove Member
    Given user sets the fields for identity of type "Basic Group"
      | userCode                | description   | type |
      | code:BG Crud add member | Auto BG group add member | Basic Group |
    When user "Search" identity of type "Basic Group"
    When user sets identity member of type "Basic Group" fields to identity of type "Basic Group"
      | userCode                       | description              | type        | operation |
      | code:BG add member basic group | BG QA Test member update | Basic Group | search |
    When user removes member of type "Basic Group" from identity of type "Basic Group"
    Then member is removed successfully from identity of type "Basic Group"
    When user "Search" identity of type "Basic Group"
    Then member is removed successfully from identity of type "Basic Group"

  @Regression-BDD
  Scenario: Delete Basic Group from search tab
    Given user sets the fields for identity of type "Basic Group"
              | userCode      | description   | type |
              | code:BG delete from search tab | Auto BG group delete from search tab | Basic Group |
    And user "Create" identity of type "Basic Group"
    When user deletes identity of type "Basic Group" from search tab
    Then identity of type "Basic Group" is deleted successfully

  @Regression-BDD
  Scenario: Update Basic Group - Add Token
    Given user sets the fields for identity of type "Basic Group"
               | userCode      | description   | type |
               | code:BG Token| Auto BG Token| Basic Group |
    And user "Create" identity of type "Basic Group"
    Given user sets the fields of access token of type "Token"
      | tokenDomain    | tokenName | password | emailAddress| activationLimit | mustActivateAfter | mustActivateBefore | validUntil | contentCode | type |
      | default domain | ADD USER TO TOKEN BASIC  | 123456   | | 2 | 2018-02-25  | 2026-12-21 | 5  | code:add user token content basic | Token |
    Given user sets the fields for content bundles
            | description | code | component | type |
            | desc add user token bundle Basic  | code:add user token bundle basic | All | Content Bundles |
    And user "Create" content bundles
    Given user sets the fields for content slice of type "Issue Range"
            | description | code | fromVolume | fromIssue | toVolume | toIssue | area | issueTypes | bundleCode | type |
            | desc add user token content Basic| code:add user token content basic | 1 | 1 | 2 | 2 | Staging | All | code:add user token bundle basic  | Issue Range |
    And content bundle is associated to content slice of type "Issue Range"
    And user "Create" content slice of type "Issue Range"
    And user "Create" access token of type "Token" by using "publication"
    When user of type "Basic Group" is associated to access token of type "Token"
               | userCode      | description   | type |
               | code:BG Token| Auto BG Token| Basic Group |
    And user adds user of type "Basic Group" to access token of type "Token"
    Then user of type "Basic Group" is added successfully to access token of type "Token"
    And Token of type "Token" is associated to user of type "Basic Group"
    When user "Search" identity of type "Basic Group"
    Then Token is added successfully to identity of type "Basic Group"

  @Regression-BDD
  Scenario: Update Basic Group - Update Token
    Given user sets the fields of access token of type "Token"
                   | tokenDomain| tokenName | password | emailAddress| activationLimit | mustActivateAfter | mustActivateBefore | validUntil | contentCode | type |
                     | default domain  | ADD USER TO TOKEN BASIC  | 123456   | | 2 | 2018-02-25  | 2026-12-21 | 5  | code:add user token content basic | Token |
    And user "Search" access token of type "Token"
    When user sets the fields of access token of type "Token"
                   | tokenDomain| tokenName | password | emailAddress| activationLimit | mustActivateAfter | mustActivateBefore | validUntil | contentCode | type |
                     | default domain  | ADD USER TO TOKEN BASIC UPDATE | 123456   | | 2 | 2018-02-25  | 2026-12-21 | 5  | code:add user token content basic | Token |
    And user "Update" access token of type "Token"
    Then access token of type "Token" details appear successfully
    Given user sets the fields for identity of type "Basic Group"
               | userCode      | description   | type |
               | code:BG Token| Auto BG Token| Basic Group |
    And Token of type "Token" is associated to user of type "Basic Group"
    When user "Search" identity of type "Basic Group"
    Then Token is added successfully to identity of type "Basic Group"

  @Regression-BDD
  Scenario: Update Basic Group - Delete Token
    Given user sets the fields of access token of type "Token"
              | tokenName | tokenDomain | password | type |
              | ADD USER TO TOKEN BASIC UPDATE | default domain | 123456  | Token |
    Given user of type "Basic Group" is associated to access token of type "Token"
               | userCode      | description   | type |
               | code:BG Token| Auto BG Token| Basic Group |
    And user "Search" access token of type "Token"
    When user removes the added user of type "Basic Group" from access token of type "Token"
    Then user of type "Basic Group" is removed successfully from access token of type "Token"
    Given user sets the fields for identity of type "Basic Group"
               | userCode      | description   | type |
               | code:BG Token| Auto BG Token| Basic Group |
    And Token of type "Token" is associated to user of type "Basic Group"
    When user "Search" identity of type "Basic Group"
    Then Token is removed successfully for identity of type "Basic Group"

  @Regression-BDD
  Scenario: Imitate Basic Group Identity
    Given user sets the fields for identity of type "Basic Group"
                    | userCode      | description   | type |
                    | code:BG Crud imitate | Auto BG group imitate | Basic Group |
    When user "Create" identity of type "Basic Group"
    And user "imitate" identity of type "Basic Group"
    Then Identity of type "Basic Group" is imitated successfully
