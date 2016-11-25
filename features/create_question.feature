Feature: create_question

  Scenario: a user wants to create a question
    Given I go to /
    Given I have created "victor@gmail.com"
    When I write "victor@gmail.com" on "session_email"
    When I write "testtest" on "session_password"
    When I click button "Enter"
    Given "Victor Navarro" has created "Humanidade e Cidadania" room
    Given "Humanidade e Cidadania" room has "O futuro do planeta" topic
    Given I visit "Humanidade e Cidadania" room
    Given I visit "O futuro do planeta" topic
    When I click button "New question"
    When I write "New question is created?" on "question-content-form"
    When I click button "save-question"
    And the object with attribute "content" and value "New question is created?" of "question" klass was created