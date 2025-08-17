Feature: Profile Page Feature
  Scenario: Profile Page Loads Correctly
    Given I land on profile page with correct data
    Then I see {'Save'} text
    And I wait
    Then I see labels and name
      | 'label'              | 'name'              |
      | 'NAME'              | 'Sunpreet'              |
      | 'AGE'         | '30'         |
      | 'DIET' | 'Veg' |
      | 'GENDER'          | 'M'          |
      | 'WEIGHT (KG)'    | '65.0'    |
      | 'HEIGHT (CMS)'    | '172.0'    |