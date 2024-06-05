Feature: Update user using PUT API

  Background: 
    * url 'https://gorest.co.in'
    * def requestPayload =
      """
       {
          "status": "inactive",
          "email": "karate33@gmail.com"
      }
      """

  Scenario: Update a user with the given data
    Given path '/public/v2/users/6947816'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method PUT
    Then status 200
    And match $.id == '#present'
    And match $.name == '#present'
    And match $.name == 'Msgr. Vedanshi Ganaka'
    And match $.email == 'karate33@gmail.com'