Feature: enter_topic

  Scenario: user tries to create a topic
    Given I go to /
    Given I have created "victor@gmail.com"
    When I write "victor@gmail.com" on "session_email"
    When I write "testtest" on "session_password"
    When I click button "Enter"
    Given "Victor Navarro" has created "Humanidade e Cidadania" room
    Given I visit "Humanidade e Cidadania" room
    When I click "new-topic-button"
    When I write "O futuro do planeta" on "topic_name"
    When I write "Aula de 22/11" on "topic_description"
    When I click button "submit-topic-button"
    Then I should be in "O futuro do planeta" topic

  Scenario: user tries to edit his topic
    Given I go to /
    Given I have created "victor@gmail.com"
    When I write "victor@gmail.com" on "session_email"
    When I write "testtest" on "session_password"
    When I click button "Enter"
    Given "Victor Navarro" has created "Humanidade e Cidadania" room
    Given "Humanidade e Cidadania" room has "O futuro do planeta" topic
    Given I visit "O futuro do planeta" edit topic
    When I write "O futuro do Brasil" on "topic_name"
    When I write "Aula dia 23/11" on "topic_description"
    When I click button "submit-topic-button"
    Then I should be in "O futuro do Brasil" topic

  Scenario: user tries to delete his topic
    Given I go to /
    Given I have created "victor@gmail.com"
    When I write "victor@gmail.com" on "session_email"
    When I write "testtest" on "session_password"
    When I click button "Enter"
    Given "Victor Navarro" has created "Humanidade e Cidadania" room
    Given "Humanidade e Cidadania" room has "O futuro do planeta" topic
    Given I visit "O futuro do planeta" edit topic
    When I click button "Delete Topic"
    Then I should be in "Humanidade e Cidadania" room
