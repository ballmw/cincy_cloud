@twitter_streams
Feature: Twitter Streams
  In order to have twitter_streams on my website
  As an administrator
  I want to manage twitter_streams

  Background:
    Given I am a logged in refinery user
    And I have no twitter_streams

  @twitter_streams-list @list
  Scenario: Twitter Streams List
   Given I have twitter_streams titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of twitter_streams
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @twitter_streams-valid @valid
  Scenario: Create Valid Twitter Stream
    When I go to the list of twitter_streams
    And I follow "Add New Twitter Stream"
    And I fill in "Username" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 twitter_stream

  @twitter_streams-invalid @invalid
  Scenario: Create Invalid Twitter Stream (without username)
    When I go to the list of twitter_streams
    And I follow "Add New Twitter Stream"
    And I press "Save"
    Then I should see "Username can't be blank"
    And I should have 0 twitter_streams

  @twitter_streams-edit @edit
  Scenario: Edit Existing Twitter Stream
    Given I have twitter_streams titled "A username"
    When I go to the list of twitter_streams
    And I follow "Edit this twitter_stream" within ".actions"
    Then I fill in "Username" with "A different username"
    And I press "Save"
    Then I should see "'A different username' was successfully updated."
    And I should be on the list of twitter_streams
    And I should not see "A username"

  @twitter_streams-duplicate @duplicate
  Scenario: Create Duplicate Twitter Stream
    Given I only have twitter_streams titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of twitter_streams
    And I follow "Add New Twitter Stream"
    And I fill in "Username" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 twitter_streams

  @twitter_streams-delete @delete
  Scenario: Delete Twitter Stream
    Given I only have twitter_streams titled UniqueTitleOne
    When I go to the list of twitter_streams
    And I follow "Remove this twitter stream forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 twitter_streams
 