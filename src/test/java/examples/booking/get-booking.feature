Feature: Specific booking id

  Background:
    * url 'https://restful-booker.herokuapp.com'

  Scenario: verify existing booking
    Given path  'booking','1'
    And header Accept = 'application/json'
    And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    When method GET
    Then status 200
    And assert responseTime < 5000
    Then match response ==
    """
    {
      "firstname": "#string",
      "lastname": "#string",
      "totalprice": '#number',
      "depositpaid": '#boolean',
      "bookingdates": {
          "checkin": "#string",
          "checkout": "#string"
      },
      "additionalneeds": "#string"
    }
    """

  Scenario: create new booking
    Given path  'booking'
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
     """
     {
        "firstname" : "Jim",
        "lastname" : "Brown",
        "totalprice" : 111,
        "depositpaid" : true,
        "bookingdates" : {
            "checkin" : "2018-01-01",
            "checkout" : "2019-01-01"
        },
        "additionalneeds" : "Breakfast"
      }
     """
    When method POST
    Then status 200
    And assert responseTime < 5000
    Then match response.booking ==
    """
    {
      "firstname": "#string",
      "lastname": "#string",
      "totalprice": '#number',
      "depositpaid": '#boolean',
      "bookingdates": {
          "checkin": "#string",
          "checkout": "#string"
      },
      "additionalneeds": "#string"
    }
    """

  Scenario: update  booking
    Given path  'booking','1'
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    And request
     """
     {
       "firstname" : "James",
        "lastname" : "Brown",
        "totalprice" : 111,
        "depositpaid" : true,
        "bookingdates" : {
            "checkin" : "2018-01-01",
            "checkout" : "2019-01-01"
        },
        "additionalneeds" : "Breakfast"
      }
     """
    When method PUT
    Then status 200
    And assert responseTime < 5000
    Then match response ==
    """
    {
      "firstname": "#string",
      "lastname": "#string",
      "totalprice": '#number',
      "depositpaid": '#boolean',
      "bookingdates": {
          "checkin": "#string",
          "checkout": "#string"
      },
      "additionalneeds": "#string"
    }
    """

  Scenario: update  partial booking
    Given path  'booking','1'
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    And request
     """
     {
       "firstname" : "James",
       "lastname" : "Brown"
      }
     """
    When method P
    Then status 200
    And assert responseTime < 5000
    Then match response ==
    """
    {
      "firstname": "#string",
      "lastname": "#string",
      "totalprice": '#number',
      "depositpaid": '#boolean',
      "bookingdates": {
          "checkin": "#string",
          "checkout": "#string"
      },
      "additionalneeds": "#string"
    }
    """


  Scenario: delete booking
    Given path  'booking','1'
    And header Content-Type = 'application/json'
    And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    When method DELETE
    Then status 201