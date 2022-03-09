Feature: validate response from file in karate framework

  Background: 
    Given url 'http://localhost:9897'
    And print "====================="

  Scenario: to test the get endpoint with json data
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    * def expectedResponse = read("../jsonResponse.json")
    Then print "expected response -->", expectedResponse
    And match response == expectedResponse
    
