Feature: Service
  As a service consumer
  I want the service to help me out if a misuse it
  So I can use it correctly

  Scenario: Call create on the service
    When I call create on the service
    Then I should receive a response

    @wip
  Scenario: Use response to view the service
    When I call create on the service
    Then the reponse should contain the url of the service
