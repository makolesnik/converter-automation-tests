@area
Feature: User is able to convert area units

  Background:
    When I click on Got it button
    Then I land on Area screen

  Scenario: User is able to swap values
    Given I see "Sq Kilometre" in From header
    And I see "Sq Metre" in To header
    When I click on Swap button
    Then I see "Sq Metre" in From header
    And I see "Sq Kilometre" in To header


  Scenario: User is able to convert default units with soft keyboard
    Given I click on Clear button
    When I click on From field
    And I press "12" on soft keyboard
    Then I get "12000000" in To field


  @many
  Scenario Outline: User is able to convert default units
    Given I click on Clear button
    When I enter "<target>" to From field
    Then I get "<result>" in To field
    Examples:
      |target       |result     |
      |1            |1000000    |
      |2.0          |2000000    |
      |0            |0          |
      |0.9999999999 |999999.9999|
      |0.99999999999|1000000    |
      |.            |0          |
      |             |0          |