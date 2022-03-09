Feature: to test the get end point of an application

  Background: 
    Given url 'http://localhost:9897'
    And print "====================="

  Scenario: to test the get endpoint with  json data
    Given path '/normal/webapi/all'
    When method get
    Then status 200

  Scenario: to test the get endpoint with  json data
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response

  Scenario: to test the get endpoint with json data
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    Then match response ==
      """
      [
      {
      "jobId": 1,
      "jobTitle": "Software Engg",
      "jobDescription": "To develop andriod application",
      "experience": [
        "Google",
        "Apple",
        "Mobile Iron"
      ],
      "project": [
        {
          "projectName": "Movie App",
          "technology": [
            "Kotlin",
            "SQL Lite",
            "Gradle"
          ]
        }
      ]
      }
      ]
      """

  Scenario: to test the get endpoint with xml data
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
    Then match response ==
      """
      <List>
      <item>
      <jobId>1</jobId>
      <jobTitle>Software Engg</jobTitle>
      <jobDescription>To develop andriod application</jobDescription>
      <experience>
      <experience>Google</experience>
      <experience>Apple</experience>
      <experience>Mobile Iron</experience>
      </experience>
      <project>
      <project>
        <projectName>Movie App</projectName>
        <technology>
          <technology>Kotlin</technology>
          <technology>SQL Lite</technology>
          <technology>Gradle</technology>
        </technology>
      </project>
      </project>
      </item>
      </List>
      """

  Scenario: to test the get endpoint with xml data
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    Then match response contains deep {"jobTitle": "Software Engg"}
    Then match response contains deep {"project":[{"projectName": "Movie App"}]}
    Then match header Connection == 'keep-alive'
    Then match header Content-Type == 'application/json'
