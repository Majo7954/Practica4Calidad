Feature: Login to Swag Labs

  Background:
    Given I am on the login page of SauceDemo

  @passed
  Scenario: Login with valid credentials
    When I login with username "standard_user" and password "secret_sauce"
    Then I should be redirected to the inventory page

  @locked
  @rejected
  Scenario: Login with locked out user
    When I login with username "locked_out_user" and password "secret_sauce"
    Then I should see an error message "Epic sadface: Sorry, this user has been locked out."
    And I should remain on the login page

  @passed
  Scenario: Login with a user with interface issues
    When I login with username "problem_user" and password "secret_sauce"
    Then I should be redirected to the inventory page

  @passed
  Scenario: Login with performance glitch user
    When I login with username "performance_glitch_user" and password "secret_sauce"
    Then I should be redirected to the inventory page

  @passed
  Scenario: Login with error user
    When I login with username "error_user" and password "secret_sauce"
    Then I should be redirected to the inventory page

  @passed
  Scenario: Login with visual user
    When I login with username "visual_user" and password "secret_sauce"
    Then I should be redirected to the inventory page

  @rejected
  Scenario: Attempt to login with empty username and password
    When I login with username "" and password ""
    Then I should see an error message "Epic sadface: Username is required"

  @rejected
  Scenario: Attempt to login with only username
    When I login with username "standard_user" and password ""
    Then I should see an error message "Epic sadface: Password is required"

  @rejected
  Scenario: Attempt to login with only password
    When I login with username "" and password "secret_sauce"
    Then I should see an error message "Epic sadface: Username is required"

  @rejected
  Scenario: Login with non-existent user
    When I login with username "non_existing_user" and password "secret_sauce"
    Then I should see an error message "Epic sadface: Username and password do not match any user in this service"

  @rejected
  Scenario: Login with leading/trailing spaces in username and password
    When I login with username " standard_user " and password " secret_sauce "
    Then I should see an error message "Epic sadface: Username and password do not match any user in this service"

  @rejected
  Scenario: Login with uppercase username
    When I login with username "STANDARD_USER" and password "secret_sauce"
    Then I should see an error message "Epic sadface: Username and password do not match any user in this service"

  @rejected
  Scenario: Login with special characters in username
    When I login with username "' OR 1=1; --" and password "secret_sauce"
    Then I should see an error message "Epic sadface: Username and password do not match any user in this service"

  @rejected
  Scenario: Multiple failed login attempts
    When I login with username "non_existing_user" and password "wrong_pass"
    And I login with username "non_existing_user" and password "wrong_pass"
    And I login with username "non_existing_user" and password "wrong_pass"
    Then I should see an error message "Epic sadface: Username and password do not match any user in this service"

  @special
  Scenario: Reload the login page without entering credentials
    When I reload the page
    Then I should remain on the login page