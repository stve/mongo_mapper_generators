Feature: Model generation
  In order to use the MongoMapper gem in a rails app
  I should be able to generate models using the MongoMapper Generators

  # script/generate theme
  Scenario: Generate a mongo model
    Given I have a new rails app
    And I have no models
    When I generate a new "Person" mongo model
    Then I should have a model named "person.rb"
    And I should have a unit test named "person_test.rb"
    
  # script/generate theme
  Scenario: Generate an embedded mongo model
    Given I have a new rails app
    And I have no models
    When I generate a new "Address" embedded mongo model
    Then I should have a model named "address.rb"
    And I should have a unit test named "address_test.rb"
