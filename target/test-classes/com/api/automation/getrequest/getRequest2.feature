Feature: to test the get end point of an application

  Scenario: to test the get endpoint with  json data
    Given the application url 'www.google.com'
    And the context path is '/getdata'
    When i send the get request
    Then status code should be 200
    And the response format should be JSON
