Feature: booking ids
  Return the ids of all the bookings that existing within the API.
  Can take optional query strings to search and return a subset of booking ids.

  Background:
    * url 'http://restful-booker.herokuapp.com'

  Scenario: get all
    Given path 'booking'
    When method get
    Then status 200
    And match each response == { bookingid: '#number'}

  Scenario Outline: filter by name
    Given path 'booking'
    And param 'firstname' = "<name>"
    When method get
    Then status 200
    And match each response == { bookingid: '#number'}
    Examples:
      | name  |
      | sally |
