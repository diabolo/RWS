Feature: Service
  As a service consumer
  I want the service to help me out if a misuse it
  So I can use it correctly

  Scenario: Call create on the service
    When I call create on the service
    Then I should receive a response

  Scenario: Use response to view the service
    When I call create on the service
    Then the reponse should contain the url of the service

  Scenario: Use response url to view service
    When I call create on the service
    And I use the response url to receive the service
    Then I should see the service

    @wip
  Scenario: Call create on the service without the requestor
    When I call create on the service without the requestor
    Then I should receive an error
    And I should receive usage instructions
