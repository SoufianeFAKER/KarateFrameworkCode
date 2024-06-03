Feature: Create user using POST API

  Background: 
    * url 'https://gorest.co.in'
    * def requestPayload =
      """
       {
          "name": "Chahed QA",
          "email": "testing44@yahoo.fr",
          "gender": "female",
          "status": "active"
      }
      """

  Scenario: Create a user with the given data
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method POST
    Then status 201
    And match $.id == '#present'
    And match $.name == '#present'
    And match $.name == 'Chahed QA'
    And match $.email == 'testing44@yahoo.fr'