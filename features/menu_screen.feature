@menu
Feature: User is able to call and use Menu

  Background:
    When I click on Got it button
    Then I land on "Area" screen

  Scenario: User is able to call meny by swiping
    When I swipe app menu
    Then I see app menu

  Scenario Outline: User is able to select metrics screen
    When I swipe app menu
    And I select "<target>" in menu
    Then I land on "<result>" screen

    Examples:
       |target            |result            |
       |Cooking           |Cooking           |
       |Digital Storage   |Digital Storage   |
       |Energy            |Energy            | 
       |Fuel Consumption  |Fuel Consumption  | 
       |Length / Distance |Length / Distance | 
       |Mass / Weight     |Mass / Weight     |
       |Power             |Power             |
       |Pressure          |Pressure          |
       |Speed             |Speed             |
       |Temperature       |Temperature       |
       |Time              |Time              |
       |Torque            |Torque            |
       |Volume            |Volume            |




                     