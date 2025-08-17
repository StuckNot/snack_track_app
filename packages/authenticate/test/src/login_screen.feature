Feature: Login Screen Feature
  Scenario: Login Screen Loads Correctly
    Given I land on Login Screen with correct data
    Then I see {'Login'} text
    Then I see {'Password'} text
    Then I see {'Forgot Password?'} text
