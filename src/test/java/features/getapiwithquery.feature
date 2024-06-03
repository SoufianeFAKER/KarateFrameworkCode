Feature: GET API with Query PArameters

  Scenario: get all active users
    * def query = {status:'active', gender:'male', id:6944239}
    Given url baseUrl + '/public/v2/users'
    And params query
    When method GET
    Then status 200
    * print response

  Scenario: get all active user and get the count
    * def query = {status:'active'}
    Given url baseUrl + '/public/v2/users'
    And params query
    When method GET
    Then status 200
    * print jsonResponse = response
    * print jsonResponse
    * def userCount = jsonResponse.length
    * print userCount
    * match userCount == 10
