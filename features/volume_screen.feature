@volume
Feature: User is able to convert Volume units

  Background:
    When I click on Got it button
    Then I land on "Area" screen
    Then I swipe app menu
    And I select "Volume" in menu
    Then I land on "Volume" screen


  @wip
  Scenario Outline: User is able to select units for conversion
    When I select "<from>" from From column
    Then I see "<from>" in From header
    And I see "1.0" in From field
        

    When I select "<target>" from To column
    Then I see "<target>" in To header
    And I get "<result>" in To field

    Examples:
      |from      |target           |result       |
      |Teaspoon  |Cubic Yard       |0            | 
      |Teaspoon  |Cup              |0.0208       | 
      |Cubic Yard|Teaspoon         |155116.0542  | 




                     