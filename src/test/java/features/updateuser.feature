Feature: Update user using PUT api

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

  Scenario: Update a user with the given data
    # 1st call : Create a user with the POST call response
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method POST
    Then status 201
    And match $.data.id == '#present'
    
    # Fetch the user ID from the post call response
    * def userId = $.data.id
    * print userId
    
    # 2nd call : PUT call to update the user
    * def requestPutPayload =
      """
       {
        	"gender": "female",
          "status": "inactive"
      }
      """
    Given path '/public/v2/users/' + userId
    And request requestPutPayload
    And header Authorization = 'Bearer ' + tokenID
    When method PUT
    Then status 200
    And match $.id == '#present'
    And match $.id == userId
    And match $.name == '#present'
    And match $.name == 'Anes'
    And match $.email == requestPayload.email
