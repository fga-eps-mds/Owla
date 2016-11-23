Feature: enter_room

  Scenario: a user tries to access his joined rooms
    Given I go to /
    Given I have created "victor@gmail.com"
    When I write "victor@gmail.com" on "session_email"
    When I write "testtest" on "session_password"
    When I click button "Enter"
    When I click "My rooms"
    Then I should be in "Victor Navarro"'s rooms

    Scenario: a user tries to access his joined rooms
      Given I go to /
      Given I have created "victor@gmail.com"
      When I write "victor@gmail.com" on "session_email"
      When I write "testtest" on "session_password"
      When I click button "Enter"
      When I click "Joined rooms"
      Then I should be in "Victor Navarro"'s joined rooms

    Scenario: a user tries to access all rooms
      Given I go to /
      Given I have created "victor@gmail.com"
      When I write "victor@gmail.com" on "session_email"
      When I write "testtest" on "session_password"
      When I click button "Enter"
      When I click "All rooms"
      Then "Victor Navarro" should be in all rooms page

    Scenario: a user tries to create a room
      Given I go to /
      Given I have created "victor@gmail.com"
      When I write "victor@gmail.com" on "session_email"
      When I write "testtest" on "session_password"
      When I click button "Enter"
      When I click "My rooms"
      When I click button "new-room-button"
      When I write "Humanidade e Cidadania" on "room_name"
      When I write "2015/1" on "room_description"
      When I click button "submit-question-button"
      Then I should be in "Humanidade e Cidadania" room

    Scenario: a user tries to edit his room
      Given I go to /
      Given I have created "victor@gmail.com"
      When I write "victor@gmail.com" on "session_email"
      When I write "testtest" on "session_password"
      When I click button "Enter"
      Given "Victor Navarro" has created "Humanidade e Cidadania" room
      Given I visit "Humanidade e Cidadania" edit room
      When I write "C1" on "room_name"
      When I write "2016/1" on "room_description"
      When I click button "submit-question-button"
      Then I should be in "C1" room

    Scenario: a user tries to delete his room
      Given I go to /
      Given I have created "victor@gmail.com"
      When I write "victor@gmail.com" on "session_email"
      When I write "testtest" on "session_password"
      When I click button "Enter"
      Given "Victor Navarro" has created "Humanidade e Cidadania" room
      Given I visit "Humanidade e Cidadania" edit room
      When I click button "Delete Room"
      Then "Victor Navarro" should be in all rooms page
