Feature: GET API feature

  Scenario: get user details
    Given url baseUrl + '/public/v2/users'
    And path '6943047'
    When method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse
    * def actId = jsonResponse.id
    * def actName = jsonResponse.name
    * def actEmail = jsonResponse.email
    * print actName
    * match actId == 6943047
    * match actName == 'Pramila Talwar'
    * match actEmail == 'pramila_talwar@lesch.example'

  Scenario: get user details - user not found
    Given url baseUrl + '/public/v2/users'
    And path '1'
    When method GET
    Then status 404
