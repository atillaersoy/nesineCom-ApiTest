Feature:Get /Iddaa/PopularBetsModal and Verify JSON schema.
  Background:
  * url getUri
  * def jsonScheme = read('classpath:/json/scheme.json')

  Scenario: get /Iddaa/PopularBetsModal and Verify JSON schema.
    Given path 'Iddaa/PopularBetsModal'
    And request {eventType: 1}
    When method post
    Then status 200
    And match each response.FilterDates == jsonScheme.FilterDates
    And match each response.PopularBetLeague == jsonScheme.PopularBetLeague
    And match each response.PopularBetList == jsonScheme.PopularBetList
    And print karate.jsonPath(response, "$.PopularBetList.*.PlayedCount")
    And print karate.jsonPath(response, "$.PopularBetList.*.MarketNo")
    And karate.write(karate.jsonPath(response, "$.PopularBetList.*.PlayedCount"),"./src/test/java/test/features/resources/playedcount.txt")
    And karate.write(karate.jsonPath(response, "$.PopularBetList.*.MarketNo"),"./src/test/java/test/features/resources/marketno.txt")
