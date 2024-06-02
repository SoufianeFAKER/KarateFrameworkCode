Feature: Test

  Scenario: Get
    Given url 'https://gorest.co.in/public/v2/users/3339791'
    When method get
    Then status 200
