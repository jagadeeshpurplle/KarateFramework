Feature: Variable creatin in karate framework


# <gherkin keyword> <def> <variable name> = <value>
# <*> <def> <variable name> = <value>

  Background: 
    Given url 'http://localhost:9897'
    And print "====================="
    * def globalint = 10
    * def globalstring = "jagadeesh"

  Scenario: to test the get endpoint with json data
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    
    
   Scenario: To create variable
     # use variable for repeating value
     # use variable for to store the data from external file
     # use variable in matcher expression
     # use variable for passing the data from one feature file to another feature file
     Given def var_int = 10
     And def var_string = 'karate'
     Then print "int vaiable-->", var_int
     And print "string variable-->", var_string
     * def x = 20
     Then print "value of x ==>", x
     Then print "global values are:==>", globalint, globalstring
     