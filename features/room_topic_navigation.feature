Feature: navigation feature

  Scenario: a user tries to go to root page from the room with the navigation bar
    Given I go to /
    Given I have created "victor@gmail.com"
    When I write "victor@gmail.com" on "session_email"
    When I write "testtest" on "session_password"
    When I click button "Enter"
    Given "Victor Navarro" has created "Humanidade e Cidadania" room
    Given I visit "Humanidade e Cidadania" room
    When I click "Home"
    Then I should be in "Victor Navarro" homepage

  Scenario: a user tries to go to root page from the topic with the navigation bar
    Given I go to /
    Given I have created "victor@gmail.com"
    When I write "victor@gmail.com" on "session_email"
    When I write "testtest" on "session_password"
    When I click button "Enter"
    Given "Victor Navarro" has created "Humanidade e Cidadania" room
    Given "Humanidade e Cidadania" room has "O futuro do planeta" topic
    Given I visit "O futuro do planeta" topic
    When I click "Home"
    Then I should be in "Victor Navarro" homepage

  Scenario: a user tries to go to room page from the topic with the navigation bar
    Given I go to /
    Given I have created "victor@gmail.com"
    When I write "victor@gmail.com" on "session_email"
    When I write "testtest" on "session_password"
    When I click button "Enter"
    Given "Victor Navarro" has created "Humanidade e Cidadania" room
    Given "Humanidade e Cidadania" room has "O futuro do planeta" topic
    Given I visit "O futuro do planeta" topic
    When I click "navigation-room-name"
    Then I should be in "Humanidade e Cidadania" room
