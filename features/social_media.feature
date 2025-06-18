Feature: Verificación de íconos de redes sociales en SauceDemo

  Background:
    Given I am on the login page of SauceDemo

  @bvt @social
  Scenario Outline: Verificar íconos de redes sociales con distintos usuarios
    When I login with username "<username>" and password "secret_sauce"
    Then the Twitter icon should link to "https://twitter.com/saucelabs"
    And the Facebook icon should link to "https://www.facebook.com/saucelabs"
    And the LinkedIn icon should link to "https://www.linkedin.com/company/sauce-labs/"

    Examples:
      | username              |
      | standard_user         |
      | problem_user          |
      | performance_glitch_user |
      | visual_user           |
