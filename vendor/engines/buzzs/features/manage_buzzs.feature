@buzzs
Feature: Buzzs
  In order to have buzzs on my website
  As an administrator
  I want to manage buzzs

  Background:
    Given I am a logged in refinery user
    And I have no buzzs

  @buzzs-list @list
  Scenario: Buzzs List
   Given I have buzzs titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of buzzs
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @buzzs-valid @valid
  Scenario: Create Valid Buzz
    When I go to the list of buzzs
    And I follow "Add New Buzz"
    And I fill in "Search" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 buzz

  @buzzs-invalid @invalid
  Scenario: Create Invalid Buzz (without search)
    When I go to the list of buzzs
    And I follow "Add New Buzz"
    And I press "Save"
    Then I should see "Search can't be blank"
    And I should have 0 buzzs

  @buzzs-edit @edit
  Scenario: Edit Existing Buzz
    Given I have buzzs titled "A search"
    When I go to the list of buzzs
    And I follow "Edit this buzz" within ".actions"
    Then I fill in "Search" with "A different search"
    And I press "Save"
    Then I should see "'A different search' was successfully updated."
    And I should be on the list of buzzs
    And I should not see "A search"

  @buzzs-duplicate @duplicate
  Scenario: Create Duplicate Buzz
    Given I only have buzzs titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of buzzs
    And I follow "Add New Buzz"
    And I fill in "Search" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 buzzs

  @buzzs-delete @delete
  Scenario: Delete Buzz
    Given I only have buzzs titled UniqueTitleOne
    When I go to the list of buzzs
    And I follow "Remove this buzz forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 buzzs
 