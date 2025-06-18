Feature: Checkout process in SauceDemo

  Background:
    Given I am on the login page of SauceDemo
    When I login with username "standard_user" and password "secret_sauce"
    And I add a product to the cart
    And I go to the cart page
    And I click on Checkout

  @info
  Scenario: Complete your information
    When I enter my first name "Juan", last name "Perez" and postal code "12345"
    And I click on Continue
    Then I should see the checkout overview page

  @cancel
  Scenario: Cancel checkout from information page
    When I click on Cancel
    Then I should be redirected to the cart page
    
  @bvt 
  @finish
  Scenario: Finish checkout process
    When I enter my first name "Maria", last name "Lopez" and postal code "45678"
    And I click on Continue
    And I click on Finish
    Then I should see the confirmation message "Thank you for your order!"

  @overview-cancel
  Scenario: Cancel from checkout overview
    When I enter my first name "Ana", last name "Soto" and postal code "78901"
    And I click on Continue
    And I click on Cancel
    Then I should be redirected to the products page from checkout overview
