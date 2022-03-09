Feature: to test the get end point of an application

  Background: 
    Given url 'http://localhost:9897'
    And print "====================="

  Scenario: to test the get endpoint with json data
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    Then match response.[0].jobTitle == 'Software Engg'
    Then match response.[0].experience[0] == 'Google'
    Then match response.[0].project[0].technology[2] == 'Gradle'
    #validate size of json array
    Then match response.[0].experience == '#[3]'
    Then match response.[0].project[0].technology == '#[3]'
    Then match response == '#[1]'
    # validate using wild card char
    Then match response.[0].experience[*] == [ "Google","Apple","Mobile Iron"]
    #validate using contains keyword
    Then match response.[0].experience[*] contains ["Google"]
    Then match response.[*].jobId contains 1

  Scenario: to test the get endpoint with json data and validate using fuzzy matcher
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    Then match response.[0].jobTitle == '#string'
    Then match response.[0].experience[0] == '#notnull'
    Then match response.[0].project[0].technology == '#array'
    #validate size of json array
    Then match response.[0].experience == '#array'
    Then match response.[0].project[0].technology == '#ignore'
    Then match response == '#[1]'
    # validate using wild card char
    Then match response.[0].experience[*] == [ "Google","Apple","Mobile Iron"]
    #validate using contains keyword
    Then match response.[0].experience[*] contains ["Google"]
    Then match response.[*].jobId contains 1
    Then match response.[0].jobId == '#number'
    #complez fuzzzy matcher javascript expressions
    Then match response.[0].jobId == '#? _ >=1'
    Then match response.[0].jobTitle == '#string? _.length == 13'
    # to validate array
    # an array or not
    Then match response.[0].experience == '#[]'
    # an array with size of 3 or not
    Then match response.[0].experience == '#[3]'
    #to check elements in array are type of string
    Then match response.[0].experience == '#[3] #string'
    Then match response.[0].experience == '#[3] #string? _.length >1'
