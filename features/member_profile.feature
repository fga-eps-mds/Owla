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

  Scenario: a user wants to create a room from his homepage, when he has no joined rooms
    Given I go to /
    Given I have created "victor@gmail.com"
    When I write "victor@gmail.com" on "session_email"
    When I write "testtest" on "session_password"
    When I click button "Enter"
    When I click button "New Room"
    When I write "Humanidade e Cidadania" on "room_name"
    When I write "2015/1" on "room_description"
    When I click button "submit-question-button"
    Then I should be in "Humanidade e Cidadania" room
