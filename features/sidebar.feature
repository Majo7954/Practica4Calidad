@sidebar 
Feature: Sidebar Logout

  Background:
    Given I am on the login page

    @logout
Scenario Outline: Logout as <user>
  When I login with username "<user>" and password "secret_sauce"
  And I open the sidebar
  And I click on "Logout"
  Then I should be redirected to the login page

Examples:
  | user                    |
  | standard_user           |
  | problem_user            |
  | performance_glitch_user |
  | visual_user             |
  | error_user              |


     @about
Scenario Outline: Redirect to About page from sidebar for each valid user
  When I login with username "<user>" and password "secret_sauce"
  And I open the sidebar
  And I click on "About"
  Then I should be redirected to "https://saucelabs.com/"
  And I see the SauceLabs homepage
  And I see the tabs and login in the top box
  And I see the title "Build apps users love with AI-driven insights"


Examples:
  | user                    |
  | standard_user           |
  | performance_glitch_user |
  | visual_user             |
  | error_user              |

  @about
  @aboutproblem
  Scenario: Redirect to About page as problem_user
    When I login with username "problem_user" and password "secret_sauce"
    And I open the sidebar
    And I click on "About"
    Then I should be redirected to "https://saucelabs.com/error/404"
    And I see an error "404 Not Found" in the homepage
    And I see a green robot next to the message

    @allitems
   Scenario: Verify item prices are visually altered for visual_user
    When I login with username "visual_user" and password "secret_sauce"
    And I open the sidebar
    And I click on "All Items"
    Then the item prices should be incorrect

    @allitems2
Scenario: Verify prices change on each All Items click for visual_user
  When I login with username "visual_user" and password "secret_sauce"
  And I open the sidebar
  And I click on "All Items"
  Then the item prices should change each time All Items is clicked
  Then Prices range from $0 to $100

    