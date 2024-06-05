Feature: Delete user using DELETE api

  Background: 
    * url 'https://gorest.co.in'
    * def random_string =
      """
      	function(s){
      		var text = "";
      		var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      		for(var i=0; i<s; i++)
      			text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      			return text;
      	}
      """
    * def randomString = random_string(10)
    * print randomString
    * def requestPayload =
      """
      {
             "name": "Anes",
             "gender": "male",
             "status": "active"
         }	
      """
    * set requestPayload.email = randomString + "@gmail.com"
    * print requestPayload

  Scenario: Delete a user with the given user id
    # 1. Create a user using POST call
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
    
    # Fetch the user id from the response
    * def userId = $.data.id
    * print userId
    
    # 2. Delete the same user
    Given path '/public/v1/users/' + userId
    And header Authorization = 'Bearer ' + tokenID
    When method DELETE
    Then status 204
    
    # 3. Get the same user with user id
    #Given path '/public/v1/users/' + userId
    Given url baseUrl + '/public/v1/users' + userId
    And header Authorization = 'Bearer ' + tokenID
    When method GET
    * print response.name
    Then status 404
    #And match $.data.message == 'Resource not found'
     And match $.data.message == '#notpresent'
