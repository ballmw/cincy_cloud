@related_links
Feature: Related Links
  In order to have related_links on my website
  As an administrator
  I want to manage related_links

  Background:
    Given I am a logged in refinery user
    And I have no related_links

  @related_links-list @list
  Scenario: Related Links List
   Given I have related_links titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of related_links
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @related_links-valid @valid
  Scenario: Create Valid Related Link
    When I go to the list of related_links
    And I follow "Add New Related Link"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 related_link

  @related_links-invalid @invalid
  Scenario: Create Invalid Related Link (without name)
    When I go to the list of related_links
    And I follow "Add New Related Link"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 related_links

  @related_links-edit @edit
  Scenario: Edit Existing Related Link
    Given I have related_links titled "A name"
    When I go to the list of related_links
    And I follow "Edit this related_link" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of related_links
    And I should not see "A name"

  @related_links-duplicate @duplicate
  Scenario: Create Duplicate Related Link
    Given I only have related_links titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of related_links
    And I follow "Add New Related Link"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 related_links

  @related_links-delete @delete
  Scenario: Delete Related Link
    Given I only have related_links titled UniqueTitleOne
    When I go to the list of related_links
    And I follow "Remove this related link forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 related_links
 