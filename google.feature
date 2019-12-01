Feature: Search with Google

  Scenario: Perform Search
    Given I set the following aliases:
      | Search        | //input[@name='q']              |
      | Google Search | //input[@value='Google Search'] |
    And I open the shared browser "FirefoxNoImplicitWait"
    And I maximize the window
    When I open the URL "https://google.com"
    And I populate the "Search" text box with "Octopus Deploy"
    And I click the "Google Search" button
    Then I verify the current URL matches the regex "https://www.google.com/search.*"