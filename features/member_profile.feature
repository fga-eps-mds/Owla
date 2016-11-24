Feature: member_profile

  Scenario: a user wants to go to his profile
    Given I go to /
    Given I have created "victor@gmail.com"
    When I write "victor@gmail.com" on "session_email"
    When I write "testtest" on "session_password"
    When I click button "Enter"
    When I click "Profile"
    Then I should be in "Victor Navarro" profile

  Scenario: a user wants to edit his profile
    Given I go to /
    Given I have created "victor@gmail.com"
    When I write "victor@gmail.com" on "session_email"
    When I write "testtest" on "session_password"
    When I click button "Enter"
    When I click "Settings"
    When I write "Matheus Vitor" on "member_name"
    When I write "moxiar" on "member_alias"
    When I write "testtest" on "member_password"
    When I write "testtest" on "member_password_confirmation"
    When I click button "Save"
    Then I should be in "Matheus Vitor" homepage
