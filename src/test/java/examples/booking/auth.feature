@auth
Feature: Authentication
Background:
  * url 'http://restful-booker.herokuapp.com'

  Scenario: Create token
    Given path 'auth'
    And request { "username" : "admin" , "password" : "password123" }
    When method post
    Then status 200
    * print response.token