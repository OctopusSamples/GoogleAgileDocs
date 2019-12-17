Feature: Search with Google

  Scenario: Open Page
    And I open the shared browser "FirefoxNoImplicitWait"
    And I fullscreen the window
    And I open the URL "https://google.com"

  Scenario: Perform Search
    Given I set the following aliases:
      | Search        | //input[@name='q']              |
      | Google Search | //input[@value='Google Search'] |
    And I start recording the screen to the directory "ExternalVideoDir"

    When I populate the "Search" text box with "Octopus Deploy"

    And I highlight outside the "Search" text box with an offset of "2"
    And I highlight outside the "Google Search" button with an offset of "2"
    And I save a screenshot to "#{ExternalScreenshotDir}/google/010-search.png"

    And I click the "Google Search" button

    And I save a screenshot to "#{ExternalScreenshotDir}/google/020-search-results.png"

    Then I verify the current URL matches the regex "https://www.google.com/search.*"

  Scenario: Close browser
    Then I stop recording the screen
    And I close the browser
