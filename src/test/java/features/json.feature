Feature: json feature testing

  Scenario: json reader parser
    * def jsonObject =
      """
      [
      {
      "name" : "Tom",
      "city" : "France",
      "age" : 25
      },
      {
      "name" : "Peter",
      "city" : "Belgique",
      "age" : 35
      }
      ]
      """
    * print 'My Object JSON is : ', jsonObject
    * print jsonObject[0]
    * print jsonObject[0].name
    * print jsonObject[1].name
    * print jsonObject[1].name + " " + jsonObject[1].city + " " + jsonObject[1].age

  Scenario: complex json reader
    * def jsonObject =
      """
      {
      "menu": {
      "id": "file",
      "value": "File",
      "popup": {
         "menuitem": [
            {"value": "New", "onclick": "CreateNewDoc()"},
            {"value": "Open", "onclick": "OpenDoc()"},
            {"value": "Close", "onclick": "CloseDoc()"}
      ]
      }
      }
      }
      """
      * print jsonObject
      * print jsonObject.menu
      * print jsonObject.menu.id
      * print jsonObject.menu.popup
      * print jsonObject.menu.popup.menuitem 
      * print jsonObject.menu.popup.menuitem[2].value
      * print jsonObject.menu.popup.menuitem[2].onclick
