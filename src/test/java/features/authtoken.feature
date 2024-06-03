Feature: GET API feature

  Scenario: get user details with token
    * print tokenID
    Given header Authorization = 'Bearer ' + tokenID
    And url baseUrl + '/public/v2/users'
    And path '6944496'
    When method GET
    * print response
    Then status 200
