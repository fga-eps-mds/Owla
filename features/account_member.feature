Feature: account_member

  Background:
    Given I go to /
    Given I have created "victor@gmail.com"
    When I write "victor@gmail.com" on "session_email"
    When I write "testtest" on "session_password"
    When I click button "Enter"
    Then I should be in "Victor Navarro" homepage

  Scenario: edit a member
    I click "Account"
    Then I should be in "Victor Navarro" edit
